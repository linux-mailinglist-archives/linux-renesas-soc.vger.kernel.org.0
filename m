Return-Path: <linux-renesas-soc+bounces-11474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D81329F4C67
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 14:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB99C7A387C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 13:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33C61F3D3A;
	Tue, 17 Dec 2024 13:36:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01AB3E49D;
	Tue, 17 Dec 2024 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734442567; cv=none; b=Jb7xxvRVlvka7PzIWSMIwZVQKdJukVVN62zJ+9E4RqupSv9lbqlrFDR8mp2wa3vgOzMe5QqGBbHr9Nq8lO7n/eXIhpFTnk5Z8LznbZ1UQnzau8qUE8RpTRId4oa2FwyEtMZD3BF8QruCISLQjfBcCwANsqpahtyji7iD+f0lNYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734442567; c=relaxed/simple;
	bh=+OJfhSy7+/bcb3wM9Q8H0Bd1dWQPgY/GYvGJjFAb+v4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUOtdr43/FD/SQ2xcgtT4LadM80x9W5gvcJulcTrSWGkJ/Tt37oFayU6dCSzgryvTK7mwwiRf9vUSJ0ea5Js988ZKEHy1Bn7Dn6QwrsoeL6PmFBfSTwjf9bdKax5yc1bj5htOGEn5Ax/5jMQYm+ZBAgiOemIYi195wDP2jUAwU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3eb9101419cso2749715b6e.0;
        Tue, 17 Dec 2024 05:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734442564; x=1735047364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmkHaZD6J8lgJAaNNA2tVsqfCUgS7g2I77JqUK/2el8=;
        b=VJ9HOebAyEPM44UzCM/1uO19Y7cuHFHgJy8/goGpwgPDybIEFCIMsnxjAZu5C1Ah/2
         GMK/3pBi/8HmWvDIHsPG11QKRmlUQpNIcw8URvkHTRmGALiI2JLRMlGGoKMlEqUvNeW1
         j2VCm+AQW+5y5TVU8ljYw+9bsxXRGf9ba7LJIThyeGI0iuL83l4yVIYXXhvwy6QMVT3e
         Ox9mwNZO3uPXvo+4RLVjpNjOkmBcuSB6wEZqe/pCc5FmF18QWcOgCrkBh/s4OsKDavVT
         4lNGfVKeLh6I+EW8BdfM6uLHlBfrwMvDiin0kq80byXJVo8DNAg5o8twmDVbHGqhh3dA
         HRAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQpzMj2gs1HFUFaT8fhJJlhXAldu03gaTGa8Bcxci+3nOsi/DMR29+t0ShzaDr7X8YB8xDPN6AUHApjtd9@vger.kernel.org, AJvYcCUTtXb+1nKXUgiOiZsw1G88hGE2UoHy8I3hf5yAPf88Pov9ks4KY58ns3z4aEoYLzL60yU7l78Kdseq@vger.kernel.org, AJvYcCVRT83yDXUZCKU+AQ8UZNQAugtVOk9S4jeQ3j4/8zhjhrRpoN9NYhT2zL821W21vMs5e6cX/03cC5OZVninL1uu9Fw=@vger.kernel.org, AJvYcCXjF4tgyBAVQs6pusY4LwCmXTpexIbCHmqmXUKqAjcaZIPiR5SFTt3VYvf8VeXo9V9UgP4W+PtloziU@vger.kernel.org
X-Gm-Message-State: AOJu0YwzWdC1h81/bAGgGRRC+0QuiMlBigA7V0gUf7+MmEQkMP7mYRa1
	0xurC4ieCQyZ1aOWnpPnZmvQ1zVWtj8i6whbzSGzweIbFMaAoYU+xsMPHpUs
X-Gm-Gg: ASbGncuOc8s31kNitdkJvEi5OqYA+ql9AWM4r8gHcamObODvDOm01FoTkmuKCiKHAak
	RqybzsJJTknIp2mXXPBvlCJfRNUEcEPtlxcgZdNft5mz6HvH2+i8ZKDreoVjxxKmJ5pCmou+kUm
	CGCBqHgiXWMLZAjTWqhSdVaOlGiCdhPua1+Lwh8VuCX41vnYKtgJiJmYVqBqNdKtUmSQVUuZQ+E
	NSjlGquEjVT9QdwSFK03fIVkW7UKFuKfDfoeue2+PnovLIoHz/eyGAQBVNqfIurjZC1h9n0jIzL
	MS0FXBcmWi/NhXlqLgqHm9U=
X-Google-Smtp-Source: AGHT+IHaJ/xAogpjVa0+gYArCyT4dLlLj8O0oocOTeo6KK/dUy2ylM//MI+wcUzfjvetReJsqwpV9A==
X-Received: by 2002:a05:6808:15a1:b0:3eb:4e94:5648 with SMTP id 5614622812f47-3ebcb27bc1fmr1470941b6e.14.1734442564478;
        Tue, 17 Dec 2024 05:36:04 -0800 (PST)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ebb478a280sm2252776b6e.5.2024.12.17.05.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 05:36:04 -0800 (PST)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3eb7f3b1342so2251186b6e.1;
        Tue, 17 Dec 2024 05:36:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUE4dnFCfqXcp7cx7k+ml5ucH4tHCCXflu0YdA24kb1AoobQ4unenh0PAYKVwkMqXuk8+p6PKw+Sn5y@vger.kernel.org, AJvYcCWWkgVH9LOdDOr4E1KuEItyElXI/XFqrFz+uescCHQ0RdsOsz9ah7c8Eli3ljYPfVM6LaQoPz8OgKop@vger.kernel.org, AJvYcCXP6wYfdgvpHwpKdSehBmKzlphJs1ljbpzF6jnMKkHNjYd2AlVXvkBip96Q0ZeLMjGf92bQWgt+o8BD45wE@vger.kernel.org, AJvYcCXxBorVsBBDgUFFdDm19HQNZkyCPOzFJ9mFa+2Y/8+B2WJH8KVRrg/CMP0IejKjsBaomD6/BkSiCoCrpvndkA72sSo=@vger.kernel.org
X-Received: by 2002:a05:6102:32c7:b0:4b1:130f:9fc0 with SMTP id
 ada2fe7eead31-4b25d9e28a4mr17003299137.16.1734442157476; Tue, 17 Dec 2024
 05:29:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com> <CAMuHMdXkXx6+0nJn+uLCAWOXvEYWLJXzLu9J7ksinn_z3bEfHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXkXx6+0nJn+uLCAWOXvEYWLJXzLu9J7ksinn_z3bEfHQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2024 14:29:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWx5v24UMV7DabxUcYJUeetGeiWidGurT2vEWRw4BTrNg@mail.gmail.com>
Message-ID: <CAMuHMdWx5v24UMV7DabxUcYJUeetGeiWidGurT2vEWRw4BTrNg@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: renesas: gray-hawk-single: Add
 DisplayPort support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-clk@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 2:33=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
> > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >
> > Add support for the mini DP output on the Gray Hawk board.
> >
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks for your patch, which is now commit b1000645dc29701f
> ("arm64: dts: renesas: gray-hawk-single: Add DisplayPort support")
> in renesas-devel/renesas-dts-for-v6.14.
>
> Apparently this patch breaks s2idle on Gray Hawk Single when "[PATCH
> v3 06/10] drm/rcar-du: dsi: Add r8a779h0 support" is not present, or
> when CONFIG_DRM_RCAR_USE_MIPI_DSI is not enabled. If the DSI driver
> is not available, the ti_sn65dsi86.bridge part fails to probe with
> -EPROBE_DEFER and "failed to attach dsi host".  Still, the sn65dsi86
> driver must do something critical, as resuming from s2idle now hangs.
> I haven't identified yet where exactly it hangs.
>
> As a result, s2idle is broken in current renesas-devel, which only
> has the DTS changes.  Perhaps I should drop the DTS until the issue
> is resolved?
>
> However, I suspect White Hawk has the same issue (if
> CONFIG_DRM_RCAR_USE_MIPI_DSI=3Dn), but I cannot verify as my local White
> Hawk is currently not available for kernel testing.

Confirmed on White Hawk by Tomi and me.

When the hang occurs, magic sysrq no longer works. However, the system
still prints "nfs server not responding" once in a while, so I added
calls to various sysrq print functions to rpc_check_timeout().
This revealed that the system is blocked on wait_for_completion()
in dpm_wait_for_superior(), called from device_resume_noirq().
Printing the actual device and parent gives:

    platform fed80000.dsi-encoder: PM: device_resume_noirq
    platform fed80000.dsi-encoder: PM: dpm_wait_for_superior: parent
fed80000.dsi-encoder

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

