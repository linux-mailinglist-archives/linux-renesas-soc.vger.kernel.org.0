Return-Path: <linux-renesas-soc+bounces-28394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBiFOsVVnGkAEQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:27:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47336176D52
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 559DE30FCD36
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 13:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E2B1A9FA8;
	Mon, 23 Feb 2026 13:21:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8694F19D081
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771852908; cv=none; b=o3X/fwhb2aAJ9wooF+gwXE+PPNDQBy/laYt4w2l/74tmBIVv1jweUcUPTa04xEWu4jdzF3p/uLbE0/E1UpmJ71vw25M6LZj/cSbXjm9NIwJItBd5Y6eHtZr41Y78l0Zu6Kl8uoJTzxYo/mCDI/Tvd08x2Ey8ErjNDuTzFmouJmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771852908; c=relaxed/simple;
	bh=DFBwfom+CxQd6x7ic+XSQnIbLdiN8FcFEBOf6x+BltY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhG+3jIVYbQ77ZtWu23z/OVEJFk8tzfqEjPBh4tsbcpneXUiliH4MFEkvrtTXdOOeYkrQyhUxsquhF9EvC9qaVkbFwUZd+eN4bH51Mjjd9OGODS6RmWIvHbIQQkL3uceoplWUTPFOQ1Qq7XegfZEm296VMvEBDek6S+rxFzev1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94d5f90c8b6so2213710241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 05:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771852905; x=1772457705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0CXl7ooZIKZBR/9WuxpQTwfG3DhRjXklstmaRrGH4A=;
        b=XKlto42w5BzGLPS2wVy13oRhV1GlGmA6n27GzqCeKS99uigvvRJY2zpMSzHnrX6zyW
         2iAJVi02XnGy/uf1xC6l6Uhlq9IXm0hazq/xSrynBaggeph+jUC2JUFl5xxLmpQief6l
         qV9+JWcfBsL4KYua0VfNAW9VT1SRWeTi1zExxpxOLewklgdTgaIZVVKJBlWiHZGGDiDk
         ePJKgrXNO7ST3fx9heFuinHXP33FGh+d92sOvlRJ82h2OpLT66PD/DBYDKiEnKenJkJl
         mtKdTdfQ8pObqKpTMNqYUTWp6mXGAflZBg5T57Bh2NBgCgOE9c0EIYSZk5mtbmrI3c+O
         YCcg==
X-Forwarded-Encrypted: i=1; AJvYcCXA2J7qLsqaFmjNhM/ogPLW84axWyDyPViGJSVTIznuNDq4hfo1UtEnqUfXNWiYgwd1ttURhltwuJp340Z0xEjKeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDFd/XO62dIkHkdc0MvoS7/GtZhBe76wb8nL7uWRsMeJ9eP38p
	Ziy4UgSP0S+Y3BtZ+rZxWycbmhcMnXaK2BMEvtN490HWa4ejxQXVD2hQFegbYRbW
X-Gm-Gg: AZuq6aLwcT383a0Hldb3OZuOCRBRwuTgIIo2Ynn+SGTNSOhLpWZhJ7FnUZV/9n96rGG
	Lu6lmbbH9kPaxHYWSgrULTNYfgbV99yh9XbkUDpkPLRCvDqcVNUrP8AiHIsAM3h1e87g2XOxFQy
	VZq6odabLCpdcoXYjQIgE/FklQo6ZUbz2KEkPB6lYM83wMwI/5GCElw/fBoR+aJJsftrpqHSUs7
	E9TUBtac7c+uzjAqufxnq4fcEiB+nlzqdi2WNuloqJcCUOH4hqTMKgVya5a5GMW2KVOmZR7f7mV
	3ok4ilhbpmlE+2jgosieRIMdjkvnJ6NlZFWfqAIyF50PxUQuM2hfPmKL65nb2Yn8oCjL9feWn4W
	odg7GZEktzW/6+oD/dOpEp9AAMvIUwONSDoo8MZYCWHMq/a3ZvVPIffLWTjUcKIRmtMcb5Ooer6
	4GSRHYVhExg7739QeZtRSOPsgbG0S0LJGgDcBS3jnCksJUKFbNDv5MYAp8zhKMTEJD//NOXu4W8
	GU=
X-Received: by 2002:a05:6102:e0e:b0:5db:d60a:6b1a with SMTP id ada2fe7eead31-5feb30f9d67mr4395609137.30.1771852905521;
        Mon, 23 Feb 2026 05:21:45 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5feb6245d40sm7747241137.4.2026.02.23.05.21.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 05:21:45 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-567530bc03fso3662143e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 05:21:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUS4Dlmdpi3sd0d1aEZkSRAjIk3qO2OkEIUb/d3yqr7GT9jHd23SOH+sZHtl/0L/c+geMAs8S3YVTpsMLTEOqLKdA==@vger.kernel.org
X-Received: by 2002:a05:6122:3306:b0:567:54cd:f258 with SMTP id
 71dfb90a1353d-568e4883762mr3858484e0c.9.1771852905007; Mon, 23 Feb 2026
 05:21:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113-device-support-info-v1-0-91e5db7f7294@imgtec.com> <20260113-device-support-info-v1-6-91e5db7f7294@imgtec.com>
In-Reply-To: <20260113-device-support-info-v1-6-91e5db7f7294@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Feb 2026 14:21:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEdzgbB=3nHTyAdM_4YjGy79wbe2nb5Uh8nGs4Fd4Jdw@mail.gmail.com>
X-Gm-Features: AaiRm51wonfdpnxXafgHLkyNjFl6HLu4ultQI2-gg0aP3kgQDiY6wlG_WR4tQxI
Message-ID: <CAMuHMdXEdzgbB=3nHTyAdM_4YjGy79wbe2nb5Uh8nGs4Fd4Jdw@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/imagination: Warn or error on unsupported hardware
To: Matt Coster <matt.coster@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,imgtec.com,mailbox.org,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28394-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,imgtec.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47336176D52
X-Rspamd-Action: no action

Hi Matt,

On Tue, 13 Jan 2026 at 11:21, Matt Coster <matt.coster@imgtec.com> wrote:
> Gate the use of unsupported hardware behind a new module parameter
> (exp_hw_support).
>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>

Thanks for your patch, which is now commit 1c21f240fbc1e47b
("drm/imagination: Warn or error on unsupported hardware")
in v7.0-rc1.

> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -525,6 +525,77 @@ pvr_gpuid_decode_string(const struct pvr_device *pvr_dev,
>  }
>  EXPORT_SYMBOL_IF_KUNIT(pvr_gpuid_decode_string);
>
> +static bool pvr_exp_hw_support;
> +module_param_named(exp_hw_support, pvr_exp_hw_support, bool, 0600);
> +MODULE_PARM_DESC(exp_hw_support, "Bypass runtime checks for fully supported GPU cores. WARNING: enabling this option may result in a buggy, insecure, or otherwise unusable driver.");
> +
> +/**
> + * enum pvr_gpu_support_level - The level of support for a gpu_id in the current
> + * version of the driver.
> + *
> + * @PVR_GPU_UNKNOWN: Cores that are unknown to the driver. These may not even exist.
> + * @PVR_GPU_EXPERIMENTAL: Cores that have experimental support.
> + * @PVR_GPU_SUPPORTED: Cores that are supported and maintained.
> + */
> +enum pvr_gpu_support_level {
> +       PVR_GPU_UNKNOWN,
> +       PVR_GPU_EXPERIMENTAL,
> +       PVR_GPU_SUPPORTED,
> +};
> +
> +static enum pvr_gpu_support_level
> +pvr_gpu_support_level(const struct pvr_gpu_id *gpu_id)
> +{
> +       switch (pvr_gpu_id_to_packed_bvnc(gpu_id)) {
> +       case PVR_PACKED_BVNC(33, 15, 11, 3):
> +       case PVR_PACKED_BVNC(36, 53, 104, 796):
> +               return PVR_GPU_SUPPORTED;
> +
> +       case PVR_PACKED_BVNC(36, 52, 104, 182):
> +               return PVR_GPU_EXPERIMENTAL;
> +
> +       default:
> +               return PVR_GPU_UNKNOWN;
> +       }
> +}
> +
> +static int
> +pvr_check_gpu_supported(struct pvr_device *pvr_dev,
> +                       const struct pvr_gpu_id *gpu_id)
> +{
> +       struct drm_device *drm_dev = from_pvr_device(pvr_dev);
> +
> +       switch (pvr_gpu_support_level(gpu_id)) {
> +       case PVR_GPU_SUPPORTED:
> +               if (pvr_exp_hw_support)
> +                       drm_info(drm_dev, "Module parameter 'exp_hw_support' was set, but this hardware is fully supported by the current driver.");
> +
> +               break;
> +
> +       case PVR_GPU_EXPERIMENTAL:
> +               if (!pvr_exp_hw_support) {
> +                       drm_err(drm_dev, "Unsupported GPU! Set 'exp_hw_support' to bypass this check.");
> +                       return -ENODEV;
> +               }
> +
> +               drm_warn(drm_dev, "Running on unsupported hardware; you may encounter bugs!");
> +               break;
> +
> +       /* NOTE: This code path may indicate misbehaving hardware. */
> +       case PVR_GPU_UNKNOWN:
> +       default:
> +               if (!pvr_exp_hw_support) {
> +                       drm_err(drm_dev, "Unknown GPU! Set 'exp_hw_support' to bypass this check.");

After marking the gpu device node enabled in DTS for Renesas Salvator-X
with R-Car M3-W (as you are aware, it is still disabled upstream
because the system may crash when the firmware is not found), this
error message is triggered:

    powervr fd000000.gpu: [drm] *ERROR* Unknown GPU! Set
'exp_hw_support' to bypass this check.

and the driver fails to probe. Using the exp_hw_support flag makes
the driver probe (when the firmware is available):

    # echo 1 > /sys/module/powervr/parameters/exp_hw_support
    # echo fd000000.gpu > /sys/bus/platform/drivers/powervr/bind
    powervr fd000000.gpu: [drm] Running on unknown hardware; expect issues.
    powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.58_v1.fw
    powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
    [drm] Initialized powervr 1.0.0 for fd000000.gpu on minor 1

I am not sure if this counts as a regression.  Given firmware is
available for this device, I'd expect it to fall (at least) in the the
PVR_GPU_EXPERIMENTAL case?

Thanks!

> +                       return -ENODEV;
> +               }
> +
> +               drm_warn(drm_dev, "Running on unknown hardware; expect issues.");
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
>  static char *pvr_gpuid_override;
>  module_param_named(gpuid, pvr_gpuid_override, charp, 0400);
>  MODULE_PARM_DESC(gpuid, "GPU ID (BVNC) to be used instead of the value read from hardware.");
> @@ -555,7 +626,7 @@ pvr_load_gpu_id(struct pvr_device *pvr_dev)
>                         return err;
>         }
>
> -       return 0;
> +       return pvr_check_gpu_supported(pvr_dev, gpu_id);
>  }
>
>  /**

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

