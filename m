Return-Path: <linux-renesas-soc+bounces-31012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFqWNfZX1mlJEAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 15:28:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 501183BCDC5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 15:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F13FF3010244
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 13:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AE430FC23;
	Wed,  8 Apr 2026 13:27:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B473890E1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654821; cv=none; b=mVzDFc/44mEcYiCSLCM83f0+2/kB3lRRi8uabPUrvbhrZrNRsyRECNmvEjGRF30KYExGRN8mvmj3WKwc6mrINofyPoCwum9cR7HQKyz5ntAf0W02VlyrGxOUst4Nyh9RocgV28RKexwjHxRToqVTFSIryG3U5P2lwNyKZmPAeUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654821; c=relaxed/simple;
	bh=eDPl1BxiRe/fUMVm6v8nPkG76S8YwwEBsYa94mj/dvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+hM4aSQ8J9I8mtrCFszJnz3ItfOefTEyxvPh8ZkEQcu+fw2vj79q+VKYsALjI+dGaUTnW+tTxiWdMsCl+C8XiBhnJj3mNpznQHDYX1qNKnnVhuSAUMeVLcIPYIMGD+Me+e8CKO4k1QaZqEYr+mm18UQiJG/UqSB60Ppa7zBuZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cb3bae8d3eso582588785a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 06:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654819; x=1776259619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11iAo9dki9YzQOZbHMLoGuCa0VnV6ePIcYUznc5FWP8=;
        b=VoQuOa9/Fo4thc11Aqq7qRwtrZn53378h92Iw6ct+EDw2LiLeAg4oFDzYGoJ9KCKlE
         FK0W03qyNHtUz3fCEdE4bfmj2Pqykj7FrvGoRwHlYKUel5g1cMj91iwFMHYq8zvv4oDv
         Uln6tUHnipOvelBjX74N1FFlu8dZWlomzYPLE7gsN+59iXWN5oPYPn1QVjNm97CCOnVG
         H7ERv3u9DbLsqtcM/cekwGtrbUOoi8yGXd8pczeWZzMUXBUg+bnT3+BICT548fXjmphx
         GnvSnTwGbW/uhUJMb9oiEcN/TBDdElv2Cb3u/ASzf6N3dEO9W37i+OlBRhoJ9g2u+o7W
         u14g==
X-Forwarded-Encrypted: i=1; AJvYcCVdYbjGmTo/CUZNrN2H2sGkBQSptBdUoMRzlk6+v0s/y3epGa6lOTHXqFKaGGUreIZSFb2igX49OKpTBZpRrrCpIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF1wZWwo+lekEwHkmLKvQmCShleiEtdFbnpJp7OT/Qi00uDm5Y
	VkCF/TrtCNSD4zkjqIDj2+dn0rJfvz0rgl2zKbjJ8x87xXczJ2fv/XT9BYTjt22C
X-Gm-Gg: AeBDievYB3ea5ui0MyYU25xJ8ooBPU+3hNofpxGchDQqXVMytSvSPM7J66j8NC1MUTz
	3n3op8Fi2qof+JHaAn7ZnyEZqStwnGYSqKx6b2iyrok+DvS88UCK8SZA0WQ3Ww/P+B09OQskY+L
	E2OujXoQHWd03H4DPfIz4uA3IydBJdIiioOmWSoeDYmt9fu0oe/UWohECd0EnUSh4Xqmc/kVz6v
	jiya9Yaauk962c0W9C1IFb71A0in3GUBTQpUFYPi7rcx/99o2Fd5V5aQDFSPJ4vGViKh/gzuOoQ
	9THrOpYSTIKrwbehTpfIAW6epAb2kxvNGVFq7G2rmxaj3Z9TvlG5H++RmtgvAo+foUx20Nm0juj
	m6RE04UyBPO6B8b3Hy0ngVdSv7JUYFzvD0HOVaI/5WjCieWlg3KTu8garq0S3qlJKyOZs3Sef0L
	ktmqJ+AIgqS2q1LWP6lsB3KKWeF0WVCxkDtib3CG6wtZtlxuBorK5b1/ND3VwJ
X-Received: by 2002:a05:622a:11c4:b0:50d:a301:2fc0 with SMTP id d75a77b69052e-50da3013857mr97090991cf.26.1775654818889;
        Wed, 08 Apr 2026 06:26:58 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8aa1c6d5856sm84549396d6.46.2026.04.08.06.26.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:26:58 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-89cc797547fso72783116d6.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 06:26:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbWWlxR6usWVH9EAuLwpaLAISW9gLwjZtaj8PsRCxLj1CosPpiMDW9zDI8/+UWIO20lc5VO4UFUM9UJPrkczM0tw==@vger.kernel.org
X-Received: by 2002:a05:6122:4b05:b0:56d:3b69:87d2 with SMTP id
 71dfb90a1353d-56dab9df26emr8767911e0c.11.1775654366102; Wed, 08 Apr 2026
 06:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com> <24d3853ca2522df21e6a071a23e23ba4ca4b7276.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <24d3853ca2522df21e6a071a23e23ba4ca4b7276.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 15:19:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-GrDWaKzxf09DRKwDkcY7W_cZrnubBWqD0w1iAYc8Kw@mail.gmail.com>
X-Gm-Features: AQROBzC36oVu26dy7QAue_JJJeRvfbuifO9CcFeX81T2keIzqU6JIH81ayIbX9M
Message-ID: <CAMuHMdV-GrDWaKzxf09DRKwDkcY7W_cZrnubBWqD0w1iAYc8Kw@mail.gmail.com>
Subject: Re: [PATCH v6 01/21] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31012-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,baylibre.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.091];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,glider.be:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 501183BCDC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 8 Apr 2026 at 12:38, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add PLLDSI clk mux support to select PLLDSI clock from different clock
> sources.
>
> Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> them in the clock driver.
>
> Extend the determine_rate callback to calculate and propagate PLL
> parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
>
> The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
> with different duty cycles:
>
> - CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
> - CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)
>
> Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
> allow the DRM driver to query and configure the appropriate clock path
> based on the required output duty cycle.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>  - Fixed rzv2h_cpg_plldsi_smux_clk_register() removed u8 width, mask
>    variables and replaced with direct use of smux.width and clk_div_mask(smux.width).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

