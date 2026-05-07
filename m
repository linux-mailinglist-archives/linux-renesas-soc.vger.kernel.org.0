Return-Path: <linux-renesas-soc+bounces-32258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LA5L525/GmDTAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 18:11:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5304EBE5D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 18:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80ADB300138C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 16:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565151F427C;
	Thu,  7 May 2026 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqcpDmqd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2C0359703
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 16:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169892; cv=pass; b=T58dHdTiED3VSp0bPfesJpDd40AHgEK7rOTdQdGfjek7cJ4am93PWTbBBB2/PWYN4my3JQ6vOO08pc+xfmGWdRTKrXx9/3cDyo/YxGUn2dVh4nwtUNLt+Wtjt/zlH3GRSbXcXT90JOwEJK3JlMXYeqg073lYbtybkSQ++geEGW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169892; c=relaxed/simple;
	bh=2wD2kavczCnryPJWhPiesAN7Mdkma4UQLXcGYexMyTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nOaAbvwVTDI/Zx9w8Mb543ue/200FDR9P/y1K+NpXLVSuGrIEwn20mKp480JuPTYgHXwHwHb9FdSZD1Sz1td/vIK1/FRRlyr4AuwTHaNDfzNmXZpaCBvHsqJOIaOFxP9u5QXQIAWdSr4V3LOBAH9BKollXpNDzrwSTEIQPDaY3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rqcpDmqd; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67c4aaf76ecso1577812a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 09:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778169888; cv=none;
        d=google.com; s=arc-20240605;
        b=K8m8XNQH3d5kFsGnndazMzxShLA7Du2CMA31VZgwHJpRFP2o5K7qZFlzg2VrjtBMT5
         gUud3sMgfhVvv6jRYudo4yu4vnIo5tfjEf4VVv9DUNkShvJCw2nQvmDtFV5IcoaKsK1i
         ejZBlh1UKftEPk4IpACw3+/uxwGQ6UuU1w5A0L8lVQBJibh7XmDamWiPQwakxv2yEv3y
         RqX5TW3aJ1w1VdG7fPiLVRXo64wQa2T4lcg2S346emfUg3lS9Jbg63mhftMAQ7ey/n0S
         w+yFjYT5bfmrk5GyMTL3LBxIzOKypGw/L6aex4TbZNxih63om8iweTsF5tnh9AdnbUPE
         JYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rRYcM1ymeTGiiOTPFjh0iZEJpeegme9tULbG2S+4zjE=;
        fh=01wufute/FCdYFzzW+PoRj3oj62AVRrjiVhf+S/C2h8=;
        b=RKq3inlG3KO87ZXrz7g1SRV4Fdqgtx2YWJ7bSOKXO3ct/e+o/28CFgfnl08gEcG16V
         HR33Fo4hsU6ILS4zyGgwaLL62iU3QMeroteCz9SRK1ufim8MdA8rocCXRG6Cme4DaX9a
         ipLwIGblrQwM3C3Fnd/dSjnwtRJn0itDju/10UEwVVqKOl2WBKFPP2z4YdVY+aBaP5xa
         FaTwm6g9iBMUhreVEnftIoHm30phGQBCRJmXHnhoeniQYWmo9iB7+nzn49gGIZ1zwcqJ
         jtcVHrV+ujBrd5CqsW/3xduwyzoQOU2dfEwn/tvavoCDidVJWyT0j+Jfmsw5yIfbulrs
         6HWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169888; x=1778774688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRYcM1ymeTGiiOTPFjh0iZEJpeegme9tULbG2S+4zjE=;
        b=rqcpDmqdCWNDWcpWefWv/cbgjdO/d532HU4+1nqY5rup2FETbT3X/YMykgAfDyUeXd
         Zv5b2JQRlKnWlrjT2AkVB1bkKe3/6q7jSNww5UJDcYXbr1xMCi8EFg5E/wlGEJW1KLf0
         +5QbYaUp4D+NV83bldLpu4yJpI3asBnKW3IsuMtNZBm/5+ez8u7TwXzEH8LSIJG1qdRj
         kpDf7JjkT9V7p6h/tbQFDc6T0fNpcgH3iu3XKU58X6LxDK5rsUJ+v/r3g0rKSHLU4sDT
         NFUetP/l/Mgd8/WZupu2PaTl/uaKS7S0FI/FkCzkU8mXwrCn82NECa/MEYtxDpU0ghe/
         P2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169888; x=1778774688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rRYcM1ymeTGiiOTPFjh0iZEJpeegme9tULbG2S+4zjE=;
        b=ls29pcgAIlA2CsvT6p9qjw3jRzN3ugnWREM6ucv18neb8CNqH63qdAuI9LMP4QUsZe
         LzAnPKA2Qk3iuVJWU33ykBxPfcHtdQ+rfluZOJXJxJ4C8l+Ctam09ouyhSv8yWTpVO0u
         2SnXAD1YvCGvJ7agFO/kmUfkupit23Dy8ZztyGA7aVDTqEB20DfKP+0XN9lSsPlPo8XV
         u4CvUeGZ4Hy52B653yP7EDBTetPRCd/STlnudFPL/cLd0FYbUgTYLMNJAAUOkTTDo4VB
         LBD3umSxBtj+MymuSiqMXCN7sL3JL0smWJvE0PjlW2EW0tD+MsgR3Hw8Df7RQLl7VVGu
         0QNw==
X-Forwarded-Encrypted: i=1; AFNElJ8XncIYfJxIsDfSVpOAttAfuPOoVCHZEU9EEyEouRc5S0+Yrj/CZkWA0TTFBrL6zuzO2v1DSclv2zWjxyuRFhrI1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjdrOf92E8tdaUBNbZXMApqIcq1XIysJTthtxabkVJgkVoRqZ3
	QA2sIp8pwDv1c/BwdDTuXOaCLNMA35Uu4LpXZ3GWZQPM+jDHBWZDwdJ+RcTfAB4RJCHcDq+lTfb
	4ly2K61CvtKUkcVY4Oa7RYBDzcq5mYbk=
X-Gm-Gg: AeBDietavnolNdHYCvCsteo5FGG7qLMSG3Ll6tvqarXiKFwgcqgCb0ViecDLgBBjAUU
	aIwAewfYAicq5C6u5XmavKFTmOe850pbfxscKkCbSPApni5DJyyQJXEY6Jrz722Os3YqEx28q+I
	REV0XDZHnUl9vt5jaqsL6KGJlIEkWZCw929mQyGjMuJx984uJ5wQL/zgC5Bf5OvFUyAp2ixIG0I
	n93wx7c+UbJbP//YSeSSP+ezwFCtM7rrKgEf6VXFjJ6ygb2wRa+VsOlZaC9O2z3PP72lbHzvqsb
	fvH1Ze+3RdmmFJQhC7Ef5J19szK764v3Cd0z822nJCw7X/PP0ulJRExAK7zPlgIyYsj58frHoo4
	DtLIH
X-Received: by 2002:a17:906:9fcc:b0:bb9:2893:6a45 with SMTP id
 a640c23a62f3a-bc56e906631mr509502466b.44.1778169752978; Thu, 07 May 2026
 09:02:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260506215650.1897177-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260506215650.1897177-3-laurent.pinchart+renesas@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 7 May 2026 17:02:06 +0100
X-Gm-Features: AVHnY4KlCXTWJqOAp_aqpaGJYpjfW3718jgkImCY1CyoWY67EfXWi7FF_O9PVIk
Message-ID: <CA+V-a8sws8WgSzMyXSKVsSCj2FhUy9CDt7qikB6d3e_xuQpEBA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Revert "media: renesas: vsp1: brx: Fix format propagation"
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9E5304EBE5D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32258-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

On Wed, May 6, 2026 at 10:57=E2=80=AFPM Laurent Pinchart
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
>  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # On RZ/=
T2H
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

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

