Return-Path: <linux-renesas-soc+bounces-31691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJc7A9N78GkaUAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 11:20:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B744813C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 11:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79D00317C9AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 09:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A603E557D;
	Tue, 28 Apr 2026 09:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epK/A8GJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBD43D7D6C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367011; cv=pass; b=BPgG+f8B4XHVrIaN1kyfjOlmQIoJW1ASJt2NsK8vUkXmwHH1xx+tPeWJ0PXADTCtFNoNIOjqHewlT9XEUyoOJyEIzFPhp3kn9kbFgVyov0L+gtKE/x9pxg4NvkqgPcEYm1t3cjxyDdBLbZlzOTYbltjxbjnL50Vd288LH7LVIYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367011; c=relaxed/simple;
	bh=WudgakiEEZRKCJgUt+BwBvOBl3iJTjt5ytU0965gmeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t8UOaQJgljsAuW2ExramosWxIqosMdUL5kmrv4lnkNtPXwfU6UbUvwLFCvQdfimB8JPb/CqeNmhxkSR8GF3EC7ebLbIna0PQk/56hKJUjxWytuIyf1Tb6yrxd0j865PGgexnE3kHTk8I7AnsaByH0nDJrV3HbBBJwLRjvl7TOfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epK/A8GJ; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-446fea16729so130718f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 02:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777367007; cv=none;
        d=google.com; s=arc-20240605;
        b=LhveQUT6yOXsKHONHh3T3WeAP6txNWmqpVlw9aqDmdmtZ+oxGn+sTgUVdbVfp5DWZT
         TZBvP9wy/Zvoarbyva/rztSFSkMPIQ3ocb3SZTRCp9bXOyreO8o5VtA67c9OAPf8f1qp
         DvWHZ1LpyEnjPIe2KzMetTDo5y0hF94R/YKr/b88I5RNBBPNSmfPd/202BiyT2eO5wpW
         /pWULB3dRorDAEE6Qv1fFDidWvB/5uvRbZbdYsF4a8wyIacWRW0FLK9qYvMyfXd10Z+y
         AmfOXuyJmTxlvRmBXTWrB6peh2nQQFbjcKlOGRWh5cJgI4MmquCSBOgMSFrQvdpVKi44
         Xn0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TV+NCII1nqpIkeIqEPMpR/uY19H62nqeKAbbKqvdEXg=;
        fh=QeF/QS8avTZvyPR6Z4lPwqfAk7OBKDxl5vffsxQNiHE=;
        b=Sqa+7DFdHvV8YHN6GhTFuEDjk5m6+bcUxDs3/CQ8Tw3+nIjD92ICIQhI7fBH6bvDFT
         VDp+xrV2zVcP5DbmJhf4teSuAQxT4WbxznoRPgeqKWsKn5tqmzLTnjvEQxGYqhrftsiJ
         0CZhnqGqRTUW0LH7sTIRKHv2m8HfT2nyTWThIUeYxct0zRK4WvWgRmQ8Je9QYltmAaOt
         0R8l+/v9wx9rk4tTBZm4M4BaDBs/t82A9Mxnp11MgFMsSrj6PhPr0g4acPwCwxRu5bvC
         qizB0wciYA0YW4g5CiG2lCmlwM9i3jhoo4KSTExOygMVR7FHShPk5UOSxR88DBFuCaYX
         CGIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777367007; x=1777971807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TV+NCII1nqpIkeIqEPMpR/uY19H62nqeKAbbKqvdEXg=;
        b=epK/A8GJQWhZyHU/RHKyLBAiPFbSdPYarb7Yu9mm03Y9+zoyuaR3mTjVvPvxBxtFBE
         xyn369Lwmu9IDVC/23JA/qdoFH4LBqqQht3tUD/kTAQn8De1mBeFvx5gGF8lVHQPgwfX
         PJeplDzYGTmS3H5UNcV8wVtT7BGjeIEDUH/BWka+A/0dZpDIf3hAT5HgJYzhLzlX0shT
         nrY7PvFVGfiIjufMMWdl1N2rvpeQ2P3En01Ar2Evq+UXmqtl/bfu+1Cz5KNeaDlEozug
         lgh9TYhdBl6PzgEMf3Mi4lw7rhU4dyMC9d0rLq1oAX/C5lXgTL0dFxjNnI5vLVY48KXH
         HeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367007; x=1777971807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TV+NCII1nqpIkeIqEPMpR/uY19H62nqeKAbbKqvdEXg=;
        b=mfE5wMVDd3Vs2pKaWIpFBlwVi6iRgMW+7xVpGmjby02H46Ay9fu2VrU49j0yxWGZyi
         FmNarsqEE1V5C8t3jHYx3vFpcly7II1CuZosCBw7YN1EQsZFwR76byjmcSlUZeXu8F6W
         2S7MZll+KWcxBdYRFwzX59lLgAInz6ObI6VAIfFwsIAxjjmrBeU3J33vZXPna5i+7/2F
         0zJGpGoCNesqy85stwIMX+540QK68JCvvDc1gUufGMxHeS3uU0XfyTH5yPKFIPCGAsX9
         33UYN1zGukTZVyHH0WQjyoLvdRduF1aAe3o842yRnXGtMF2XNHFzY779iJ21A0AkaNEG
         HiAw==
X-Forwarded-Encrypted: i=1; AFNElJ+f+mJFKI+iDjMy/QRxNyWpbUc9KGeuDvbRgtCPq/uALnZa/opg+ilobhRMdI00YRw7RTNjJ7pTZBmt0cVh6PxbmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbPjYNRoMkKQH9zvjkHXRK/5JZlF2couPo12O5GXS31bRt2ucS
	BYf/atfsgbWOEERbu38jV9B1aChN4meBxxKfLeex+u2owZ3jfMXEh1reMQPBH2KHlMp7xfPYfLC
	VB9j+bPqYWqmsNMeoD1apFZsRtFPhi1A=
X-Gm-Gg: AeBDietvOH93OfF4gy63KsdQHr0+Cf6aZvq9J65lm+lJkTP49dMkvKVyoJhZEUIQFil
	64Z+SUaZAwc/2tH6fTcc58SMwwOs1s0vl2XcmRD7xy12bnZtIKzP5tlpb92LXXD9+RbuaMdyMeh
	+MDK76lfndsKoctmR6vMwOLHmmOJicjUv6qqktXhEDEp4w6hROdXfzjR3AH7C7hgZcYkU2y89jU
	s7iycyzEqX3/xnsRz3lDzNTP2UqqUkgjf2IeUCIYBFkoN32mOCkeZiPYUHUOeWtf+YL4U0CUG/0
	QdNpOjQx+X2t/rrpGN4h0p8clpcRj0etNosbRXKWukaleGPtvQDtbUpzP6Kg1eEheulsR2Vky4V
	Xzufxbg==
X-Received: by 2002:a05:6000:2302:b0:43c:ef4f:79dc with SMTP id
 ffacd0b85a97d-4464839c70amr4230601f8f.8.1777367006841; Tue, 28 Apr 2026
 02:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425215037.3557213-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260425215037.3557213-1-laurent.pinchart+renesas@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 Apr 2026 10:03:00 +0100
X-Gm-Features: AVHnY4K74HH73rMTr4l9H8YH9IjE_ttAYeHuyBI97H1S7pBrnmvHtUimsPZP3fE
Message-ID: <CA+V-a8uL7PAkSSvK+Qj3N3Z9LXe_B-nGJdfn9qG9rA6sXo34aQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "media: renesas: vsp1: brx: Fix format propagation"
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 70B744813C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31691-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Sat, Apr 25, 2026 at 10:50=E2=80=AFPM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> This reverts commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f.
>
> The change to format propagation in the BRx broke configuration of the
> DRM pipeline. Revert it to fix the regression.
>
> The original commit was meant to fix a v4l2-compliance failure, with no
> known userspace applications being affected beside test tools. Reverting
> is the simplest option, a more comprehensive fix can be developed (and
> tested more thoroughly) later.
>
> Reported-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Closes: https://lore.kernel.org/linux-media/CA+V-a8t481xuwava0nb7uY9CUPqF=
WZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com
> Fixes: 937f3e6b51f1 ("media: renesas: vsp1: brx: Fix format propagation")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
> This is a fix for a v7.1 regression.
>
> Prabhakar, I have test this on R-Car Gen3 with
> kms-test-plane-position.py and it fixes the regression I reproduced. The
> symptoms were not identical to the ones you reported on RZ/V2H, so I
> would appreciated if you could confirm that the patch fixes the
> regression for you too.
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_brx.c
> index b1a2c68e9944..9d93cb8b8e82 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> @@ -156,20 +156,14 @@ static int brx_set_format(struct v4l2_subdev *subde=
v,
>                 compose->height =3D format->height;
>         }
>
> -       /*
> -        * Propagate the format code to all pads, and the whole format to=
 the
> -        * source pad.
> -        */
> +       /* Propagate the format code to all pads. */
>         if (fmt->pad =3D=3D BRX_PAD_SINK(0)) {
>                 unsigned int i;
>
> -               for (i =3D 0; i < brx->entity.source_pad; ++i) {
> +               for (i =3D 0; i <=3D brx->entity.source_pad; ++i) {
>                         format =3D v4l2_subdev_state_get_format(state, i)=
;
>                         format->code =3D fmt->format.code;
>                 }
> -
> -               format =3D v4l2_subdev_state_get_format(state, i);
> -               *format =3D fmt->format;
>         }
>
>  done:
> --
> Regards,
>
> Laurent Pinchart
>
>

