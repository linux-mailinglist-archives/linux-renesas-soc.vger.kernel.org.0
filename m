Return-Path: <linux-renesas-soc+bounces-28071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FFSE/HUiWklCAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 13:37:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B2E10EC08
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 13:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36E93300A8D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 12:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6BF37647D;
	Mon,  9 Feb 2026 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGcrb4mZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2321E376470
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770640114; cv=pass; b=QFwsnGi1zOgiyxCGVCI+Aw78c/e031wyxGRbCRzbaa7iKLeYtLbBq9q3bplMalJT3hN1Vkd+5d7bWVkpmvmTL5Fq5ixhXquk+/QZCKXub8rqUwvH+c8lcA83/HRaPz62WRWTtmRxgiDFvwW50y21B26VD4LbC2fDTEYhoFKaHKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770640114; c=relaxed/simple;
	bh=AjRlWaYsW7ON0GJN0WjeDSsZURLHotWAUuc159HjAn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPaQ9MsIrHKAbPyWU0r+uk8Bv3/ynm6wohl8/LhIlZnlK90fmpftwdOmH5bU6KdKxtMWpYXFmPzWfRBpjvypix9kHBxH2bh3XM+6vBFK9YtAdAJFRLxhJaox1BEzgnDr7EPZoJq2FvkgKBvzywA/ghsps5TDT635fqcPHw0k23E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGcrb4mZ; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-436e87589e8so1151805f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 04:28:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770640112; cv=none;
        d=google.com; s=arc-20240605;
        b=XsIyRQzpVsFLewSK+ee9/E3jdgrbt7Sklo4y+Y1icjiaJFznLdWUgI4EaAiVSwY6aV
         FvC8/FzwASPll+L/EBr3Okc8ExNbDOfPWqWRyFd+VAHIm3AIJRc9cepNJ/svFDNNEMz6
         +mX6iT+9JWw8xEnZi5act4SZ04RYqVn94GCTNFVjCr8voNO5FCKEWoT+DuAlHzy5eNPX
         7WR3r/oVCOsb8lt0mmVvBJm1lH+60muHeyumsMMyzvC3aVBt7g7+XNJn9hCUv9SWTuqA
         xM6mmyJTY8fcX1tNJ7XNr/WH7a9jJ9FepMQfSGP7Xxb2Lrhj8oeVmTBfHANCezzDDqto
         9SRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8rqLaylJQoEadFpFQ9cVP7gyL0VWhbwU4Jf8Ealm+9Y=;
        fh=+t6Htc68/FvzJzaL3outqo6tLD5wwZkjsZqwTO3qbZ8=;
        b=VoUwvVe+uhMhON9IUz9l8fp0Km/Z97J5mYj8bABYO8YiG1KwUn9HeKI02MEWeAfZj2
         7bjiLHvlgbFIxXHCUtSWLCLs6WR76f6erHllQwg8YGBtN1x+yXVnB3hybRHLPjY8XakW
         D2u2F0NCGnMttCowbXF0atEKhKilgBF0z/DD+YNhLu4O3AVrrIJqThPZEtiINCm5qhfy
         W35ToSjcETPs1NA4SXhvHghWJ1mwqH/Dm1gWo3LNAur0xNA6+y4j7w4Hhee3Ge25133M
         06mSYPydylmo7PG8vp8jlThlwFVJN7hLFtFD4HYTHMuhbgWEAMd7V+n1+/G2FMc88fNW
         81kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770640112; x=1771244912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rqLaylJQoEadFpFQ9cVP7gyL0VWhbwU4Jf8Ealm+9Y=;
        b=kGcrb4mZQj9iJXN75sP+1ZG1aIZH+8z4X+jVFLH3hLWBX0CkXtRZdntnEDbQCEQXsm
         5NSF5leMorcohYd8ygqU9k+whliu5gf4pKe9oKKeKIr1evpE5WLUk3TRZyfHx0Ue4v/I
         3OCFvsTzoSpavNui+0prTt6+mMRXsS2cSvvMna/bzTCLZYJWfvvjHpOIpXnVo4+EqZJO
         YTDnD8QSUn0TpfvWFI2tz1NXHu/hMP6MtD1yuaKtIJ1PnM6Rr2g6nLAdTqysTM337+QU
         8rAU9H2ExGHCqnKrURzB15n1T7z5eUvN+DZ4aHiPfjcFBp4+ZFcDpPhxFzNPLSUs9ZsC
         C9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770640112; x=1771244912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8rqLaylJQoEadFpFQ9cVP7gyL0VWhbwU4Jf8Ealm+9Y=;
        b=GCqY4lEOiEFMM4aNI/IBJOpLkHUrlTOld+B6/zOVPtIXt+Zq3DNBv9HJWhqjC8jYOY
         sBgSfXjXPQSz8+IsmjeW8gFX23xPfU+Ei0TwIch59aDiQ4jFpaRwiFFGYQ5DMxb1Qy3s
         K08busm15DAzSrPTQFifmx16w/iRqXzNev525bS0J1pMO5HMiSq9Hk/kYNAWcecuGAx0
         af1MWLeRqkwWD1gaQ1FJu8BCeBpri3H36vJvO5x267YpowK4wzjkpgreydtMt5AD+gMB
         w+Qrjsuver1jaZHO+AMPbd3FDIJvVcCME5V2uoT/MDyDokNEadFIh8oXRJauxNxVk4Lk
         /5pw==
X-Forwarded-Encrypted: i=1; AJvYcCVVH2+NSefIF3rU3+M4ApU5Eg3nAhFiLWi0ecU4JYJckFBfLhfVKpv69pTFKc5GpB5kDbw+1zs5ccCXyWVBTcdnWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaVxMtf1Zc8M/853169zsk5dEvYzgT+FYQeq5kFKzAS+vVEkDj
	e84rrzrp2aGtIm6dfWgHVY+KSh1PLrYd4/5FQuzpGZsoUcKiPpc/lVFM84sYQSe0wzNsFy/lCAq
	p78TUhwknrrSXMLoOxKucHbSrCLb9ZQM=
X-Gm-Gg: AZuq6aJmJAAbbqUIfMsnrxZi2rC7hXat7GYM4n1x42RruVbrjnBLPMPJsXFaUy5Svnu
	ZqymeCHnuCaLWO532HhZ/fwpLGNfbyjWC4wDUwZ1OhqikFL8mTtBtXOxa0HEqMYAscIfYhZ5CNU
	ASBadlQar/CfO/L27e0Ynxd2znFinTxeMC84cMllaez+inlR1/9tDlpBhaV/QjW8LRB77I+hSLf
	La1MOdR1sHkzM9RB7gU+Ap51cJzA/8cgJkgvE/Fafb+LHwpi//IGuTcYwl/ngyglB0s3+CKjBAN
	8S/+ke7GlKdlCrjsoqN/tk7c+zAxO07B+m93Ovc++7FoX1USGgvA3UHC79y7VYzgfQf8aGWNSVf
	Iu9BD8IQ0vgDc
X-Received: by 2002:a05:6000:2209:b0:435:9241:37b4 with SMTP id
 ffacd0b85a97d-4362938ffe3mr19624465f8f.53.1770640112091; Mon, 09 Feb 2026
 04:28:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com> <dc9b5f379bcec34a7276d5d769828fde4231595e.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <dc9b5f379bcec34a7276d5d769828fde4231595e.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Feb 2026 12:28:06 +0000
X-Gm-Features: AZwV_QhWE3m-0Cf9oFsMG8j9Et_-hSHC_oSoZvKiTZg5SGLg2ociSjZxhHZs0jg
Message-ID: <CA+V-a8smn9bRGeTaYv4WUEXSPuu1CBgzqainupBc-h6kpUWJbA@mail.gmail.com>
Subject: Re: [PATCH v4 14/20] drm: renesas: rz-du: Add RZ/G3E support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org, 
	laurent.pinchart@ideasonboard.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28071-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,ideasonboard.com,vger.kernel.org,bp.renesas.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8B2E10EC08
X-Rspamd-Action: no action

Hi Tommaso,

Thank you for the patch.


On Mon, Feb 2, 2026 at 12:04=E2=80=AFPM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> Processor (VSPD), and Display Unit (DU).
>
> LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
>
> Depending on the selected output, the correct SMUX2 clock parent must be
> chosen based on the requested duty cycle:
>
>  - Index 0 for LVDS -> CDIV7_DSIx_CLK (DUTY H/L=3D4/3, 4/7 duty cycle)
>  - Index 1 for DSI/DPAD -> CSDIV_2to16_PLLDSIx (symmetric 50% duty cycle)
>
> To support this behavior, introduce the `RG2L_DU_FEATURE_SMUX2_DSI_CLK`
> feature flag and extend the `rzg2l_du_device_info` structure to include a
> features field. Also, add a new helper function `rzg2l_du_has()` to check
> for feature flags.
>
> Add support for the RZ/G3E SoC by introducing:
>  - `rzg2l_du_r9a09g047_du_info` structure
>  - The `renesas,r9a09g047-du` compatible string
>
> Additionally, introduce the missing output definitions
> `RZG2L_DU_OUTPUT_LVDS{0,1}`.
>
> Introduce `rzg2l_du_crtc_atomic_check()` helper to store the routes from
> the CRTC output to the DU outputs.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - Instead of using clk-provider API to select the right parent clock,
>    based on the outputs. Just set the correct duty cycle based on the
>    output, this reflects at CPG lvl to select the right parent.
>  - Updated commit message accordingly.
>
> v2->v3:
>  - No changes.
>
> v3->v4:
>  - No changes.
>
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 48 +++++++++++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 26 ++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 11 +++++
>  3 files changed, 85 insertions(+)
>
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/=
drm/renesas/rz-du/rzg2l_du_crtc.c
> index 6e7aac6219be..c51ba4b8c383 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -64,11 +64,32 @@
>  static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc=
)
>  {
>         const struct drm_display_mode *mode =3D &rcrtc->crtc.state->adjus=
ted_mode;
> +       struct rzg2l_du_crtc_state *rstate =3D
> +               to_rzg2l_crtc_state(rcrtc->crtc.state);
>         unsigned long mode_clock =3D mode->clock * 1000;
>         u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
>         struct rzg2l_du_device *rcdu =3D rcrtc->dev;
>
>         clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
> +
> +       if (rzg2l_du_has(rcdu, RG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
> +               struct clk *clk_parent;
> +
> +               clk_parent =3D clk_get_parent(rcrtc->rzg2l_clocks.dclk);
> +
> +               /*
> +                * Request appropriate duty cycle to let clock driver sel=
ect
> +                * the correct parent:
> +                * - CDIV7_DSIx_CLK (LVDS path) has DUTY H/L=3D4/3, 4/7 d=
uty cycle.
> +                * - CSDIV_2to16_PLLDSIx (DSI/RGB path) has symmetric 50%=
 duty cycle.
> +                */
> +               if (rstate->outputs =3D=3D BIT(RZG2L_DU_OUTPUT_LVDS0) ||
> +                   rstate->outputs =3D=3D BIT(RZG2L_DU_OUTPUT_LVDS1))
> +                       clk_set_duty_cycle(clk_parent, 4, 7);
> +               else
> +                       clk_set_duty_cycle(clk_parent, 1, 2);
> +       }
> +
>         clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
>
>         ditr0 =3D (DU_DITR0_DEMD_HIGH
> @@ -248,6 +269,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc =
*rcrtc)
>   * CRTC Functions
>   */
>
> +static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
> +                                     struct drm_atomic_state *state)
> +{
> +       struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_sta=
te(state,
> +                                                                        =
 crtc);
> +       struct rzg2l_du_crtc_state *rstate =3D to_rzg2l_crtc_state(crtc_s=
tate);
> +       struct drm_encoder *encoder;
> +
> +       /* Store the routes from the CRTC output to the DU outputs. */
> +       rstate->outputs =3D 0;
> +
> +       drm_for_each_encoder_mask(encoder, crtc->dev,
> +                                 crtc_state->encoder_mask) {
> +               struct rzg2l_du_encoder *renc;
> +
> +               /* Skip the writeback encoder. */
> +               if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_VIRTUAL=
)
> +                       continue;
> +
> +               renc =3D to_rzg2l_encoder(encoder);
> +               rstate->outputs |=3D BIT(renc->output);
> +       }
> +
> +       return 0;
> +}
> +
>  static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
>                                         struct drm_atomic_state *state)
>  {
> @@ -296,6 +343,7 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crt=
c *crtc,
>  }
>
>  static const struct drm_crtc_helper_funcs crtc_helper_funcs =3D {
> +       .atomic_check =3D rzg2l_du_crtc_atomic_check,
This change and adding rzg2l_du_crtc_atomic_check() can be a separate
patch as the same changes are required for T2H and its not specific to
G3E.

>         .atomic_flush =3D rzg2l_du_crtc_atomic_flush,
>         .atomic_enable =3D rzg2l_du_crtc_atomic_enable,
>         .atomic_disable =3D rzg2l_du_crtc_atomic_disable,
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_drv.c
> index 0fef33a5a089..84e6bf186f5d 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -51,6 +51,29 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a0=
7g044_info =3D {
>         }
>  };
>
> +static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du_info =3D =
{
> +       .features =3D RG2L_DU_FEATURE_SMUX2_DSI_CLK,
> +       .channels_mask =3D BIT(0),
> +       .routes =3D {
> +               [RZG2L_DU_OUTPUT_DSI0] =3D {
> +                       .possible_outputs =3D BIT(0),
> +                       .port =3D 0,
> +               },
> +               [RZG2L_DU_OUTPUT_LVDS0] =3D {
> +                       .possible_outputs =3D BIT(0),
> +                       .port =3D 1,
> +               },
> +               [RZG2L_DU_OUTPUT_LVDS1] =3D {
> +                       .possible_outputs =3D BIT(0),
> +                       .port =3D 2,
> +               },
> +               [RZG2L_DU_OUTPUT_DPAD0] =3D {
> +                       .possible_outputs =3D BIT(0),
> +                       .port =3D 3,
> +               },
> +       },
> +};
> +
>  static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info =3D {
>         .channels_mask =3D BIT(0),
>         .routes =3D {
> @@ -64,6 +87,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09=
g057_info =3D {
>  static const struct of_device_id rzg2l_du_of_table[] =3D {
>         { .compatible =3D "renesas,r9a07g043u-du", .data =3D &rzg2l_du_r9=
a07g043u_info },
>         { .compatible =3D "renesas,r9a07g044-du", .data =3D &rzg2l_du_r9a=
07g044_info },
> +       { .compatible =3D "renesas,r9a09g047-du", .data =3D &rzg2l_du_r9a=
09g047_du_info },
>         { .compatible =3D "renesas,r9a09g057-du", .data =3D &rzg2l_du_r9a=
09g057_info },
>         { /* sentinel */ }
>  };
> @@ -74,6 +98,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output o=
utput)
>  {
>         static const char * const names[] =3D {
>                 [RZG2L_DU_OUTPUT_DSI0] =3D "DSI0",
> +               [RZG2L_DU_OUTPUT_LVDS0] =3D "LVDS0",
> +               [RZG2L_DU_OUTPUT_LVDS1] =3D "LVDS1",
>                 [RZG2L_DU_OUTPUT_DPAD0] =3D "DPAD0"
>         };
>
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_drv.h
> index 58806c2a8f2b..c6f9dc46ab31 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> @@ -20,8 +20,12 @@
>  struct device;
>  struct drm_property;
>
> +#define RG2L_DU_FEATURE_SMUX2_DSI_CLK  BIT(0)  /* Per output mux */
> +
>  enum rzg2l_du_output {
>         RZG2L_DU_OUTPUT_DSI0,
> +       RZG2L_DU_OUTPUT_LVDS0,
> +       RZG2L_DU_OUTPUT_LVDS1,
>         RZG2L_DU_OUTPUT_DPAD0,
>         RZG2L_DU_OUTPUT_MAX,
>  };
> @@ -46,6 +50,7 @@ struct rzg2l_du_output_routing {
>   * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_=
OUTPUT_*)
>   */
>  struct rzg2l_du_device_info {
> +       unsigned int features;
The member description needs adding.

Cheers,
Prabhakar

>         unsigned int channels_mask;
>         struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
>  };
> @@ -73,6 +78,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_devi=
ce(struct drm_device *dev)
>         return container_of(dev, struct rzg2l_du_device, ddev);
>  }
>
> +static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
> +                               unsigned int feature)
> +{
> +       return rcdu->info->features & feature;
> +}
> +
>  const char *rzg2l_du_output_name(enum rzg2l_du_output output);
>
>  #endif /* __RZG2L_DU_DRV_H__ */
> --
> 2.43.0
>
>

