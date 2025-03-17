Return-Path: <linux-renesas-soc+bounces-14525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17907A65615
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 16:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 045F27A689A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 15:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA3D33F9;
	Mon, 17 Mar 2025 15:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HEIav9mz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C466176AC5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 15:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742226113; cv=none; b=tW6Hqv1AeV9i1Fp73o0wDkC/hW0SOHgJP2dWu7+3WVC5KWHu2KIPLrMjXB4pYJSm5Jc0gDsT+Bq18fzleQZZdDmVuHvpuXVudkZYpozF952GN9KxLktnoFpMnbB9wAW5J+ePfpbikIQ4u3OstcJ3Ycn77LPl2JjSmY0v+kT1CNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742226113; c=relaxed/simple;
	bh=G4wur4DVDtUGtY+JC/BnzdIJ47cqhy+qgGDguDBO8CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=NYLBjprk4/NbpCPieHndlGJ5N5CPDaug4gcJP+Cbm0io73dbBBoyWEJASd1VkNmp7duD05PdDq9uAPDoHNaXKYge5YFmnnx7VVVPTl/9vIUrKefVaztH5jJ+4wGOBSTD78qYrMZCa5t7FZDPFosjo0rzCExqoLhIqoC/PyfNMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HEIav9mz; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-547bcef2f96so5128088e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 08:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742226108; x=1742830908; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4wur4DVDtUGtY+JC/BnzdIJ47cqhy+qgGDguDBO8CU=;
        b=HEIav9mz345hH6Iolttd5tn4BagqJEWdssewXO+d1hlUszGmqBe1vDbKNByTNvIrGn
         kkyrJSeTwAEu3AoZgLsuDLlIvEEB/XhpFST8FCuQNiTRa89YuiwPPf6wffTpSSUcMX5z
         RmEIhhoH+dyIsailNa3jHssrDn61LqiQNucfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226108; x=1742830908;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4wur4DVDtUGtY+JC/BnzdIJ47cqhy+qgGDguDBO8CU=;
        b=QQZtBzhAgsZ/tu2B52k99vUbzoaI14J/2G6mle5oY0PcmvkK4mtAbE0aO3r6m68/pF
         65a834anKAY2Y1Y0ByZWPiqR3yKvPgMsChNLYQ7msgH1SjtlYRYLgcs2hCatXfIfcqr6
         0GM30iaD5WtMZQlVfp5EZNsCteRF8Gq+FKZ8M1hzUHETWGIMuDFnRPbmO8PLLQeNBIkx
         zdJ+5gU5zKB6dKGRXpZyD82q2eoYbWvf8rKBY8pQVOqwRKm6w96C+l/lkeccMGSLYjtA
         yka3Oo99Rh32WgepF271o6IHWb+TgKLJz/geo0qum2RFJH89VOEV/8sCobhzcSs+AaAy
         htBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV70o4LEoHZIP/SSykZg6KsoNHK4vJ4C9weoBtUrGMLjQc0565P4aM+A3fa0k9MFSfqgkIGTA8xwnhZWCnvPMsltg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPEeruz8RuUjKwhJM7NJvawUWQBWgpp9kl9tl7KO2qRpBpiO/P
	z6CoNE5HL8BeHHsgWut9py+cFvkm4wLU+fG1IFZr7bJJqlf08u4ikGkjZPmg7We8nGqNqnot5q9
	8PQ==
X-Gm-Gg: ASbGnctoAxiV/jGCbNZLZTVBzhylKw4fli6KA039osCFL4BjbWlHPnaLTuOQ91ovYN/
	fjpMap+xfVC9KR3P0PbozzqOTApMR6tC2z6rHfReKw19uCjzK6o6DdAHdXx4nBy+K2QaglBR3ic
	wqxqaR0jFn5bKVAjmKquDnKYqPSYqzmOA0uSBtWZ+puOA+jtbc9ZoYaZSxCV/ekaEQYNT3QXpCT
	gmzRm5/g5G81DsWNdmv31KYta8EEFGLXULZAMpggC42/TnyHGIeOrNkZgR9s4O/bqKgjaT00HQ6
	mghA7ikYWpr1xsWbaVxop1sf8CeCyi403DXsEHtj/aDG46irDnLgrj58NYPCU1uqQ8QzmDFXW5E
	EU6r3Vke+
X-Google-Smtp-Source: AGHT+IG1jv5nq+VmYLAhJ79tG2JL8mKj/zyR8/gtJCR8nKp4Ij1U1o4W4OmwQioaxh2fH3vOBCnk8Q==
X-Received: by 2002:a05:6512:280d:b0:549:7d6e:fe84 with SMTP id 2adb3069b0e04-549c3c977c1mr6044570e87.53.1742226108136;
        Mon, 17 Mar 2025 08:41:48 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1c2e91sm15826361fa.67.2025.03.17.08.41.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 08:41:47 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5495c1e1b63so5663556e87.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 08:41:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV20HVCl3FT0xCG96JqxwqgmY1ZTfu8i8NByToC8Ssp2wnwhvI+/jBU2nC2ckyFIJh6wjA//Oy+WmM5iQoyZkV/FA==@vger.kernel.org
X-Received: by 2002:a05:6512:68e:b0:545:f70:8a95 with SMTP id
 2adb3069b0e04-549c3989f17mr8892700e87.32.1742226106287; Mon, 17 Mar 2025
 08:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314224202.13128-2-wsa+renesas@sang-engineering.com>
 <CAD=FV=VBHfg+Fgp27ieYVhd0U8kDp2E0ATW+=ueM8EBNOYMoSg@mail.gmail.com> <Z9VBtTzNgDh_QsxX@ninjato>
In-Reply-To: <Z9VBtTzNgDh_QsxX@ninjato>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Mar 2025 08:41:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U_rYXZtN7Jw_E4UCjsnNcgtYC=EJ1+BLWiAwVEyo1M7w@mail.gmail.com>
X-Gm-Features: AQ5f1JrQ_jp1uS0V6XyXOkUiGcqHWJHxsb3uac6rP3mbR6gy2h4X8JXIkIfmOMg
Message-ID: <CAD=FV=U_rYXZtN7Jw_E4UCjsnNcgtYC=EJ1+BLWiAwVEyo1M7w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Check bridge connection failure
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Doug Anderson <dianders@chromium.org>, 
	linux-renesas-soc@vger.kernel.org, Phong Hoang <phong.hoang.wz@renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 15, 2025 at 2:00=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Doug,
>
> > Seems reasonable to me. I would probably put an error message in this
> > case, though? I don't think regmap_read() necessarily prints an error
> > so it would just be a mysterious failure for why things didn't probe,
> > right?
>
> OK, can do that.
>
> > This also only solves the problems for one of the 4 devices in this
> > file. I think the GPIO device, PWM device, and DP-AUX device will
> > still confusingly stick around. It's probably better to add a bogus
> > regmap read in ti_sn65dsi86_probe().
>
> Could be argued. I just wonder about all the other error cases in
> ti_sn_attach_host() plus ti_sn_bridge_probe(). They have the same
> problem with the other devices dangling?

They do, though the other ones don't seem quite the same to me. It
feels like an i2c device not actually showing up on the bus is a
_somewhat_ normal/expected error. It also is an error that would
affect all of the other sub-devices, so making sure they're not
dangling is something that is worth doing. It feels like other errors
that ti_sn_attach_host() plus ti_sn_bridge_probe() are likely to face
are either unexpected (like a small memory allocation failing or an
i2c transfer failing after a previous one succeeded) or are errors
where leaving the dangling devices isn't really a problem. For
instance: if somehow you fail to link up to a MIPI source then it
feels OK that the GPIO / PWM and DP-AUX bus parts of the bridge
continue to dangle. You can still use them, right?

-Doug

