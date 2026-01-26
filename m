Return-Path: <linux-renesas-soc+bounces-27445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA3/MnqSd2m9hgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 17:12:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 490508A8AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 17:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36BA13015D33
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337F72DAFB5;
	Mon, 26 Jan 2026 16:12:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924E22D9EC2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443959; cv=none; b=Epd2WRRFVMNU4bkB5SGlND27O0OTsLlo9ban2pfhKkD3MtQ9Ix2A7U5DImKwM+XmDlsjottLxtpFECCVoNjFpgBM3lyLPFxXV3F5cp9DGyFLlJA5DALlKJ576msqeyvppRpsBRIzcfKSl0YzS94m/EnDi452R3a3+ZoHhK3Vzmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443959; c=relaxed/simple;
	bh=ZVEYPIdz79RWr1ln7aRsRkIDCN/em83Z6vA1u5GyPPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMoMtbYTia+RSeXAD5Ag69QQKL3DwRKVZgBr3vHXc5qX7RefWlUwZeG6rxQJtTcLiMhzwF9Mzvsz4CLN9fM18VR/BnXHSgeVcO1tmbat7+BK9QmYXxCyk1HelNawT1gbAIf8QnkXmBuBdOc0f3Qho4cOA59IdGW88hnSxha3TYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5f52ed75c45so3264187137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 08:12:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769443956; x=1770048756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qznwophNIFvx/Vkp694TKOz6iGJDGxAq1XnuuR3raPY=;
        b=sgVMV9QbnFCsmFWwWfXRnhBGYBbCPVFl+aMIV+fion62osYcq3RYyrO2STvq2clKf1
         N5B2Cv6VXlcGukhobmk9xlG12ncZeyRUhx2dTnps1AAlJWSQZ6roA+AMVRBghFDlGY++
         9r63hnsns3gJTIv3muDxBKByz9OXilmLGU+NPbFokAlTbFlkILrB77e27xCKvIIuaHgR
         qvG2TK3zxPUI1VuqeQoolbfgHTR0Ujo2sIMWxhFQLVTH+4KKQ4ER03P8BKOeOSBa3b6Q
         AZ5HAe+kbqUigz0ZKeovHVVjle8yS/XSkY5CCnEr8eyHjAdAuszzCHUfNSJQBY5PgLeG
         FFoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfrJlKlTqHCz11Kp+CZeE6GRQy41JksnzZ6U8LBixRtKNQjTJsYRKm8tLpZtmsKwiZ6xVe91FKUD9s6nGILpL2dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5/kTZu0vHtoRJOT7fcZx7G0kF/1pN2wvKraB6i2FAYEFutIiY
	kHjXC29p3EcT1v3iObYvf0j8HTrStYcW4CPrEq7iGU0843dfSEw4a+0NcNhwT2AR
X-Gm-Gg: AZuq6aLWEAZqg0pmNOz5P/6OTHqT8f4QkvmWTr/pqKjRgothfwz68xJTZb1UtifuCwa
	MuOwFJmrGx+tuVidljGiVJwET1BB8F2oow1V0v7Xb5gNKDkAbBeY0piirFaEo8ipV3EYeR0CKdO
	O+O2nZ6/L7KR5apFzZHpRL3So0FPwxjIQEDgDgHbod4/NNmZvoGrIlcO/xDrYM20RSGWCrbD7we
	l8pou/FeHyHDCMYKmIbQYahWIgIx8QJSKn5ZbbrGoFxY1FcsICkg4O4V8wbe2y3czJPMGb7RB3X
	JwfNIjBFKYC8wg1XFNzIDhIz9HxoBxKH5IxOrH8eWHZ55224QOHdCkCVXCa0dZccCWsHGk/XXl4
	zXA2zxaHiCDOC/dVuGu48hCftNvHlCVe8V3YwhOQuuRNdiNSV5B2UyElISXRzl9wapKYNGeEZM9
	CE5h3Yn1s7HvWMqztIBTl6oTlnI6OT+yvQ1Bx3z0C2S8NfNYZV
X-Received: by 2002:a67:cb0f:0:b0:5f1:b865:aaa4 with SMTP id ada2fe7eead31-5f5764aca95mr1097933137.21.1769443956333;
        Mon, 26 Jan 2026 08:12:36 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948469a695asm1071076241.8.2026.01.26.08.12.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 08:12:36 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-941063da73eso2649392241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 08:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcn2H/x9s0TuVA8GwHP0xl7hxvonEqkV7vuq8VOMrToaWW541pSJhvhjRUiR6IUg/u6PDIrmVonR3ByoRom5YpRA==@vger.kernel.org
X-Received: by 2002:a05:6102:ccc:b0:5f5:3f97:58df with SMTP id
 ada2fe7eead31-5f5764a857fmr1465004137.27.1769443955874; Mon, 26 Jan 2026
 08:12:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com> <20260120150606.7356-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260120150606.7356-4-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 17:12:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVB490OOVY6B2Y6DORnWoc0LYvafLKAoRSOqFFP_nybOg@mail.gmail.com>
X-Gm-Features: AZwV_QjuRevvHvM3o_QLjPDxA4Vw5PVnFEn2Vv2g6csusKMTyFdOTWDc-v6Wjt4
Message-ID: <CAMuHMdVB490OOVY6B2Y6DORnWoc0LYvafLKAoRSOqFFP_nybOg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: versaclock3: Add freerunning 32.768kHz clock support
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27445-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 490508A8AC
X-Rspamd-Action: no action

Hi Ovidiu,

On Tue, 20 Jan 2026 at 16:06, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The Versa 3 clock generator has an internal 32.768kHz oscillator that can
> be routed to the SE1, SE2 and SE3 outputs. This patch exposes it as a
> fixed-rate clock ("vc3-clk-32k") and makes it available as a parent for
> the SE1/SE2/SE3 muxes.
>
> The 32.768kHz clock is only intended to be used when explicitly requested
> (i.e. when a rate of exactly 32768Hz is set). Selecting it as a fallback
> for other rates can cause issues, for example in audio configurations.
>
> To enforce this, introduce a new helper function,
> _vc3_clk_mux_determine_rate() which rejects configurations where the
> 32.768kHz parent would otherwise be chosen implicitly.
>
> Two new fields are added to struct vc3_clk_data:
>   - clk_32k_bitmsk: bit mask for selecting the 32.768kHz oscillator
>   - clk_32k_index: index of the 32.768kHz clock in the mux parent list
>
> They are used by clk_mux callbacks to select the appropriate parent clock.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/clk-versaclock3.c
> +++ b/drivers/clk/clk-versaclock3.c

> @@ -1038,6 +1087,14 @@ static int vc3_probe(struct i2c_client *client)
>                 return ret;
>         }
>
> +       /* Register fixed 32.768kHz clock */
> +       clk_32k = devm_clk_hw_register_fixed_rate(dev, VC3_CLK_32K_NAME, NULL,
> +                                                 0, VC3_CLK_32K_FREQ);

If you have a system with multiple versaclock3 instances, I believe
this will fail for all but the first instance, as clock names must
be globally unique.  Upon closer look, this is the case for all
other clock names in this driver.  See e.g. commit f491276a51685987
("clk: vc5: Allow Versaclock driver to support multiple instances")
(and subsequent fixes) for how to solve this.

> +       if (IS_ERR(clk_32k))
> +               return dev_err_probe(dev, PTR_ERR(clk_32k),
> +                                    "Failed to register %dHz fixed clock\n",
> +                                    VC3_CLK_32K_FREQ);
> +
>         /* Register pfd muxes */
>         for (i = 0; i < ARRAY_SIZE(clk_pfd_mux); i++) {
>                 clk_pfd_mux[i].regmap = regmap;

 Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

