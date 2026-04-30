Return-Path: <linux-renesas-soc+bounces-31772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPopEswK82mSwwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 09:54:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CEA49EEFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 09:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46BDF3001CCF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 07:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F3F3E1D18;
	Thu, 30 Apr 2026 07:54:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11FE3FADE9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 07:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535686; cv=none; b=pHNDy6lGZoVdSrFDkQIv4aLj9x3hVb0PVHQ/SAktdDbO0fCMBTfbHRMAIErydyVa4JA65uMSKCkRIo11VEf9cHCyNfV4vgAipichYVNUORVPc8E4lUbwYd/jep96BvTPgCsnN3akempiINlIcdpw4Zr+svsv6UpJKNwsNRRzNao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535686; c=relaxed/simple;
	bh=Qx7N7XiwMTRZOnlR3A3+kreNFdqkjoXXuGIkHSLG/HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shJ/TxybM9xj5pjfG+dxP59LPO1o1ekC1eLiLc3fNV6B8dRWa1PamTJcjtwoDNGAGESCCMunYPh1HanjsVwrx5N9vySE+NE5OAjuP568jEQwPbDVJWePvGlyFTMuI8Zii1qwMZojbpAvf0/qPVUzRdZTsP5STWdcuWGrH8r63bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6949831a7bcso341964eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 00:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777535683; x=1778140483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SE8U24d9+nmbb0Ym2Vjd+YsrRui7aXN0DwD087novig=;
        b=pfptjtg/+HmMnhNbMmQOkOGWp9jNtyzvSWDVWI4FkNuLzEjIWiN82B1lOFQd/RysVh
         rWAj2v4zh7GnFlOaYECfxsL5TqgqBjum7eCYLkcs91x6Re35zsDKGZ3IzzjFouSbnfu+
         88XbndbY9Ipg9XKqIiL0zaprMNV4O0ESK0y2p04GgW5IEmOdrKqEDpNHKdnyObMOJbGB
         YxOCgb1HjgocPqkISgoxR/Yn1z23afkDr0QSbPFopC7UlAH/wlF7O2+QLmtcez7Dp67d
         ZZh2lvJ6jncPi5doZUlfOY5vYdDFh4WKC+vN4SjkaCGRRnyJ4HiaApkavlsWTjVLCNgZ
         qWlw==
X-Forwarded-Encrypted: i=1; AFNElJ8NL/aEHE2dlLPKtlFqGkJfqN9kfXlr81aFBapErjEepQDPOx2p8/WriLvQKGvLC0ObVkVfnPpTcmcgYo32E1v1KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/n3XbA6gNTCVKnifkGPV93MQa62+3XpxSpLBJSNNtjfq2NKmK
	QqIpDPomel0WVyGZJiHeJwl0cUNPxRsYvSSsZ2kZiocNPyWbYXPtkrkxg0M6hbUd+NA=
X-Gm-Gg: AeBDiev+m0wCLp+p0sUtAmZuWkDJqox3R5J/Ze+M8J0TRl6QK0MtmneLQvucL+pUe2w
	8Qm073PDYnt3Oao3VOXQgfOkvFLiIBnIAEUDWEjuRGdve80Iwxu6YCF1qVAMQuscHhpxuidPH2W
	qk4j070XxKNsTklL+l3/anARSG914lG6iMCWLlQKzm+b1uKlGDwJONuLNnRIze1l1zvnPyadq+k
	77CtX7w68H/55gtKMskWDiOBjX8KDmS+VGIhM0xkmqzOBwZ3mK0JqV8H5dwxKown+3v2x/xHdki
	lW8kvdiui5bW4hxi0kk0aXa1LcmkciQZXM7UHesxrFDHIuTVuujwhBUzf30MXeI/nsBAzhHYt/6
	7/EyWl9cLhEY4RkVDPWyhv7yNXvbpRqEqehk0hJjFZEstV+SjLBb9wH0jFwdXAsj6UVzp5h7n02
	ZYhZOurhSsy3t/yz79PTHUBf0xyFSXxlNZy4qWugqOTaE8tbdED1KlPSXhzP2xcelOjLfEKIg=
X-Received: by 2002:a05:6820:61d:b0:68b:990a:8eb3 with SMTP id 006d021491bc7-6967a9f56c6mr832117eaf.34.1777535682972;
        Thu, 30 Apr 2026 00:54:42 -0700 (PDT)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43436a811a7sm991739fac.1.2026.04.30.00.54.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:54:42 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-694891f8f62so365413eaf.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 00:54:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/QWiWghk2WMdF18HXqLOS9lTXqIm9H9brHvTteh0nyRlOe+GsftJ5ohVY6kqbHsh4vbiNlN4a375z21MZQ9EdX0w==@vger.kernel.org
X-Received: by 2002:a05:6102:2c03:b0:607:97b7:c283 with SMTP id
 ada2fe7eead31-62adc184803mr537851137.14.1777535299133; Thu, 30 Apr 2026
 00:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260429170012.366537-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260429170012.366537-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 09:48:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUne5vUermQ7NnN67-QL_PM-SxJQogFpmSVUo1ussohXw@mail.gmail.com>
X-Gm-Features: AVHnY4JziB5Cy-6q6RNu-Sgl0OAxCbsRcDaFW7edOENQcMoEBistztZzpXDIEcw
Message-ID: <CAMuHMdUne5vUermQ7NnN67-QL_PM-SxJQogFpmSVUo1ussohXw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: renesas: rz-du: Add support for RZ/T2H SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 45CEA49EEFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31772-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,ideasonboard.com,lists.freedesktop.org,vger.kernel.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.649];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email]

Hi Prabhakar,

On Wed, 29 Apr 2026 at 19:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/T2H (R9A09G077) SoC includes a DU with a DPI interface,
> supporting resolutions up to WXGA with two RPFs for layer blending.
> Unlike earlier RZ/G2L SoCs, RZ/T2H requires explicit assertion of a
> DPI output-enable signal (DU_MCR0_DPI_EN) during CRTC startup.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> @@ -20,6 +20,8 @@
>  struct device;
>  struct drm_property;
>
> +#define RZG2L_DU_FEATURE_DPIO_OE       BIT(0)  /* Has DPIO output enable control */

Note that this addition conflicts with

    #define RZG2L_DU_FEATURE_SMUX2_DSI_CLK BIT(0) /* Per output mux */

in "[PATCH v6 15/21] drm: renesas: rz-du: Add RZ/G3E support"
https://lore.kernel.org/11313371ef0b31cb5f014e171ba0d9868eb0710d.1775636898.git.tommaso.merciai.xr@bp.renesas.com/

> +
>  enum rzg2l_du_output {
>         RZG2L_DU_OUTPUT_DSI0,
>         RZG2L_DU_OUTPUT_DPAD0,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

