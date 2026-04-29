Return-Path: <linux-renesas-soc+bounces-31747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOWiCy/g8Wn3kwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 12:40:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D24930FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 12:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB29B3003812
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 10:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A9A3E51FD;
	Wed, 29 Apr 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cF5Fjv6g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D8738A733
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459237; cv=pass; b=BZdatjOXXasB8sJjiFSzMFmDtUT5fsT9bRw1qgo0eKUVAW2upF4aQLMSPHs/pw2DFS/uHB0o4X5/YzDV4wGgwz5Udo+UTLEdXIbKOtJq+IKrg3tq3eo9+wGUJDWSipCM8TFOAYhfEyXz7GFhnbP4mbujz/CvSk/btN+qGUIqU1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459237; c=relaxed/simple;
	bh=LhpSdxfrVY8JvEaYR3ftoxrJGdzEwO2Wc4iqb2u430M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=H5w2dnWW5DULF4SEWeXcxUPuN0oWK/JWFG1VBgKyiIZEOHY5WAKla9SZeJlcX6u2yfXunCZDxiGsfnQ5+CjYsN1izmbqbX4npCTb4GrSd6okAvuQF/O3ti91SOdNESORljrtq+N9WZxD8CmJw1REV2Y9Z1tWB4NdtZPloY6JrCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cF5Fjv6g; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b4583f0a1aso78607875ad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 03:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777459235; cv=none;
        d=google.com; s=arc-20240605;
        b=DGEicH7CXEhLepXgeUq1jWzbzhjZ0QGHLdRiAf9bbrwwwVADSDP+h88J/bJMfbC0g4
         UjjWH62MEO7LfhTCvP87/UFh7vOMVaHkYkhSQLBTffzkfgU7iofrh+6aiTRFIBwi6tjN
         tBn4ZtUapQHK4tMT/B6m1D17h1kRfTAFS0CqB+tr9t9NJjMeOc3bGUn2eWDmTC5e06eZ
         myxD3EHvFPyg9OEhFYCVCz0uM6lv3OtdaD/eVPxn6hdvfB7mZ08ZZkhxDSWWdHUzGCbm
         kPcp6TPDtcXX4cIM41F4+9tlwlridKQIfqDsrutE2iB/M3UxsayU73spwv/iLPg8oYJW
         Y1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fuysltsgFk0WIKWoVBX9JLiSUYJAJCsTpkzdgV9Xocc=;
        fh=o5n+q7+jIqXkVMkf99H6BngcrUTrJCGtXhdyBEEgY0M=;
        b=QW/lAtaT101Dv1c1q1iMrT2AqS+5LpW0zzenyhWVyJ1+kWmnupretYDz7KRrCsf1ev
         yzbcDw5GWF4QjBLxp5INop22fCd7490iTUiK8xt4ts6mQVUj4TQm0QvoIeWdb0eoj9nh
         nypiMh0+pLO7wf18rnRG9UMWcDlXycXMcRQanyLXdyxZABulkxbJS6zgGYPPgrlyRhOt
         l+nyCMGES33JyDkrlGHUByZFX1+GhRdkW5edjxXw9sLri1f0HuKuN9NB4eZXveiJB8tx
         bzCZwMJYdQHQktjkNCIiqyoSKbbUe+V3J/m/KXASfmxp1hA9iyZe6x86nD6+pE/zU5rs
         jizw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777459235; x=1778064035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuysltsgFk0WIKWoVBX9JLiSUYJAJCsTpkzdgV9Xocc=;
        b=cF5Fjv6g09K8TJ714/vffmmQe2amAX9xlB0VOX9VghXlijzmDm4unVXh5Xtx8ctLsR
         eS5CE+ACD1w2AbDuCvp4x1bQwShTXvCXRij1MfxnuSYh3C9DVZEEfJPkYIeWgqELgQmu
         wnlpofqsp+AfuiPQUn+jd/MTPdENZLcSTd3IipOYGS76nP1+xjxSU4KWNitRo4CduFcX
         BgqmXrABnwEDEgZ6uc+RYwe0e0FxdvmnOmDxrBNF/wDAcsxoUd0Et5cMv4XVxcVBIiIm
         s6h5Yn5lTpOdyV2Kw2w9KJTOhpLfns8uK+PFS9x0Au4fpetmdchDF/rVdbSKLKtejKrU
         rz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459235; x=1778064035;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fuysltsgFk0WIKWoVBX9JLiSUYJAJCsTpkzdgV9Xocc=;
        b=ENWsa7KIbYdvYRfW+3s/lY6rIRqlVt0vTjjGmLWkJUzOLQ9khAly/8WBBAHewB/ke7
         FtGZTn7FPg+yi5xOcgjuEVBDb4N0jnLtDHVZO5wmWEJpJWR6Vg7kmQOUhLR6Tckiu4V4
         onD9UEdTdAsUFdfKSvjaaPwSdSqqbS4Y/r+lkuc+8GTRcDsNUPw0oOgfJ2yUAGSLwXxl
         EZfYTjGCsexr4Can0NS4StIrtKOV1uMIBNHN25zsF4oQKh5yEG6vgmBB2PIl/Q7RGDg8
         6VPVR2cbVZPO0dIbR5vSwT/RCRm9pcqusAevbNouW4HGLqhP6Vytbp0LxSWOd4DzCbtG
         K2xg==
X-Forwarded-Encrypted: i=1; AFNElJ/dmWEis0yFCQyf4pxki5eexHAoLNlGF0yIGTaqlsuP09FK0GvPr3QbcJCQTMCrwRsrRJWsuS9ccPTjurgDI70j4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxewe+m0IyMpFcF0xdfwHtHU5Mh2DHZ+BCkBOsz+Ojib57Mz7uL
	hnLwdm1+jw9rnbD8iX9eqjQyALJtL95RtWV9JU3VfPzJFMUo+8Xg+pdKE4viM8J4subg+ube4+v
	S67IWd2YTYr9tC8bfoAGyljaU9y6Lf2/AQfj2
X-Gm-Gg: AeBDiev3mZug/fcBQ+iN5JmGIrHB2u1AOf0GcOFCqzIz+Wj2VQmq7DE2ERaGWOv5nx9
	GHi8vqMxbxXE69xLKyzRtFXiiY6egeuF6WvasBDypRBsN6zLKRHMfCLuGSlFQdgy3OeuYXdrGIv
	L8neCbtfNrQNs5IJZZeeMdC6GsuTdul6/s0vgTKAG6rTZ0Zv4qhJB2ZJQa/YVs7CBz+90a3Nalz
	1i7GJXsPEfyUhQ25oC/PFN1vThF6xEr6XkXmLJtbF/ER7V+cliNFngPRgxVw9UYIDXpLasJj1bU
	542tr5zmjFcu4G5Lfkybo+KXFP5b2u9THcuwpzm1X7ZIObd0
X-Received: by 2002:a17:903:283:b0:2b2:b117:1e1b with SMTP id
 d9443c01a7336-2b97c41faacmt69454005ad.17.1777459235313; Wed, 29 Apr 2026
 03:40:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319083207.17195-1-phucduc.bui@gmail.com>
In-Reply-To: <20260319083207.17195-1-phucduc.bui@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 29 Apr 2026 17:40:22 +0700
X-Gm-Features: AVHnY4Kzi4RMJAKx8NXbCdv3hrvj3qC4xvrlROsAZps_yFekvWzD_M8yHPqAL3g
Message-ID: <CAABR9nG6nQaX26Y-ocrp_=hHCVBi0H6wCty-fmvZuPsYLvB9Sg@mail.gmail.com>
Subject: Re: [PATCH v3] drm: shmobile: Fix white screen after resume when LCDC
 is stopped
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, geert@linux-m68k.org, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, 
	wsa+renesas@sang-engineering.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 076D24930FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MISSING_TO(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31747-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,linux-m68k.org,ideasonboard.com,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,suse.de,sang-engineering.com,glider.be];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Hi all,

Just a gentle ping on this patch.

It has been reviewed and tested, but I haven't seen it being applied yet.
Is there anything I should fix or resend?

Thanks!


On Thu, Mar 19, 2026 at 3:32=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The LCDC on R8A7740 may show a completely white screen after resuming
> from suspend (s2idle or s2ram).
>
> After resume, both Set A and Set B registers are reset to 0. As the
> Frame End interrupt is not generated while the controller is stopped
> (DO=3D0), the hardware register switching mechanism is not triggered.
> Consequently, Set A remains at 0x00000000 even though a valid Start
> Address is written to Set B, resulting in a white screen.
>
> This is a timing-dependent race condition. In some configurations,
> debug options slow down the resume path enough for a Frame End
> interrupt to occur, which can mask the issue.
>
> Fix this by priming both register sets with the Start Address while the
> controller is stopped, ensuring a valid base address is available
> immediately after resume.
>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> Changes:
>  - v3
>    Update commit message, add Tested-by and Reviewed-by tags
>  - v2
>    Fix incorrect use of lcdc_write_mirror() for LDSA2R in
>    the DO=3D0 path; use lcdc_write() to update both register
>    sets as intended.
>
>  .../gpu/drm/renesas/shmobile/shmob_drm_plane.c  | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers=
/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index b61fda52d17a..23c8489dba71 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -70,6 +70,7 @@ static void shmob_drm_primary_plane_setup(struct shmob_=
drm_plane *splane,
>         struct shmob_drm_plane_state *sstate =3D to_shmob_plane_state(sta=
te);
>         struct shmob_drm_device *sdev =3D to_shmob_device(splane->base.de=
v);
>         struct drm_framebuffer *fb =3D state->fb;
> +       u32 ldcnt2r;
>
>         /* TODO: Handle YUV colorspaces. Hardcode REC709 for now. */
>         lcdc_write(sdev, LDDFR, sstate->format->lddfr | LDDFR_CF1);
> @@ -78,11 +79,19 @@ static void shmob_drm_primary_plane_setup(struct shmo=
b_drm_plane *splane,
>         /* Word and long word swap. */
>         lcdc_write(sdev, LDDDSR, sstate->format->ldddsr);
>
> -       lcdc_write_mirror(sdev, LDSA1R, sstate->dma[0]);
> -       if (shmob_drm_format_is_yuv(sstate->format))
> -               lcdc_write_mirror(sdev, LDSA2R, sstate->dma[1]);
> +       ldcnt2r =3D lcdc_read(sdev, LDCNT2R);
> +
> +       if (ldcnt2r & LDCNT2R_DO) {
> +               lcdc_write_mirror(sdev, LDSA1R, sstate->dma[0]);
> +               if (shmob_drm_format_is_yuv(sstate->format))
> +                       lcdc_write_mirror(sdev, LDSA2R, sstate->dma[1]);
>
> -       lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS)=
;
> +               lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRC=
NTR_MRS);
> +       } else {
> +               lcdc_write(sdev, LDSA1R, sstate->dma[0]);
> +               if (shmob_drm_format_is_yuv(sstate->format))
> +                       lcdc_write(sdev, LDSA2R, sstate->dma[1]);
> +       }
>  }
>
>  static void shmob_drm_overlay_plane_setup(struct shmob_drm_plane *splane=
,
> --
> 2.43.0
>

