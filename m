Return-Path: <linux-renesas-soc+bounces-460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8957FF234
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 15:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2E041C20DA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 14:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B964879F;
	Thu, 30 Nov 2023 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3288C85;
	Thu, 30 Nov 2023 06:37:07 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-db538b07865so734321276.2;
        Thu, 30 Nov 2023 06:37:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701355026; x=1701959826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubNrCHVyZzj2qPt/uf3pVQDDBxXzuXcyUHuCPh1smK8=;
        b=mpHQlaCP3kORXX7PIU803IFZhg0NKW1ugb91YA5Az6vfOCq9xpdHOtHtnOrlzWLoSB
         RS2IUF5vH6YIE+J3GZd5QJKAHWMUXBtyxhAetrEDSeGE2BAM+pZuW7TvGD0kEpo27L4/
         63/29baMkcKRZClPYD9f42GrEtQUdQ4S+wqDyBmIM4l7sUYRKIhpX+bfUHphvzQCSKOj
         F7spfe763BMCx28cz0r0dIx4B0vrUqZBTn0/03jvOvXXOs/r+fRiwjInzfIj9axUYrtE
         ftQGSiP5Y512Udd4FELC4IB3Ez8dQMh4BENPe+7s0FnB8r9uUnzk7CEvVD6zv0PQfcii
         NXRA==
X-Gm-Message-State: AOJu0YytCjBBlSKRJGw9rMegJvKrwimVUefnewaKIt+W1T/124HjDTcw
	tLWlQ7iaHX2syA/zpoSurZea6VDfc2af8A==
X-Google-Smtp-Source: AGHT+IGTnFgt8fmV09WizIKjZvQSldeq9vwKFXMalfT8I0LjuChq3P1r1JDs4DvCZ0CwGv6AB7InIw==
X-Received: by 2002:a25:ac90:0:b0:d9a:3bbb:8602 with SMTP id x16-20020a25ac90000000b00d9a3bbb8602mr22372652ybi.64.1701355026198;
        Thu, 30 Nov 2023 06:37:06 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id e127-20020a253785000000b00d9cd730e4d0sm265520yba.26.2023.11.30.06.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:37:05 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-db49aa82c89so960196276.1;
        Thu, 30 Nov 2023 06:37:04 -0800 (PST)
X-Received: by 2002:a25:2e44:0:b0:db5:3f82:8d1f with SMTP id
 b4-20020a252e44000000b00db53f828d1fmr1347891ybn.36.1701355024364; Thu, 30 Nov
 2023 06:37:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87v89k0yyj.wl-kuninori.morimoto.gx@renesas.com> <87ttp40yxt.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ttp40yxt.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2023 15:36:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUEGH6zThE7JhwVJwNC-HORyabrFf_JZzw2h6hLU_vj-g@mail.gmail.com>
Message-ID: <CAMuHMdUEGH6zThE7JhwVJwNC-HORyabrFf_JZzw2h6hLU_vj-g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] of: add __of_device_is_status() and makes more
 generic status check
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 3:15=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Linux Kernel has __of_device_is_available() / __of_device_is_fail(),
> these are checking if the status was "okay" / "ok" / "fail" / "fail-".
>
> Add more generic __of_device_is_status() function for these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

