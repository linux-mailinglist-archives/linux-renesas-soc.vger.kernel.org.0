Return-Path: <linux-renesas-soc+bounces-28075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KA0CdrjiWnGCwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 14:40:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DBC10FD22
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 14:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E561D300693F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 13:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B383793C2;
	Mon,  9 Feb 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVmlO7/c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189583793A6
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770644430; cv=pass; b=XSA7R5L9k0M7CU94Guz1JrlD/BNKsBNBRUjXlaBldZBAt/hdWY3o3yoYeg/el4aEOPKVFLPZui7RYh4/4d8OgJ3zodmiIvKfSMfMGIsGQ5zbpkw+M4PC6nBanaca1oSCHY7gE57WOrudGdhbQ6o6TWvSZXAEIQiFZiO2ARIj7aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770644430; c=relaxed/simple;
	bh=R1Asw47nW8KbTcIT5in3zyK3FGQv2KlKo6oaVI/Z6yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msTbUuvUsRFPJfm51erWSKb2lbq23kBMU1ymQF0jobfNFMqOjegbo4d/w+0Jf0kwWw99FNY+CWHUObeO3IzjIEcRymlZIbA1E4syuAm0xNySDKo9wQwiIqxEx0N0HZnCt0p/ipU93J7TAENKByEZQi/dd2Tev2W1mFQntKAzV3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVmlO7/c; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59de2d1fc2cso6603599e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 05:40:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770644428; cv=none;
        d=google.com; s=arc-20240605;
        b=jUaGwqjR743dBzbfHSjdecNsU4KdEBWe+LfiGw6y8wjLN+P+ZoABcYipDbGS2zUGH1
         RkTWGmjWO/K1ABfP8yB9cOvO9TWKZkrpUeWGBbmXeAypToV8TQRkscKX0djfpDmV+r6Y
         fSvc2/TGnqoAj/Ndl11OWpKGdBIHEUrLBQGzys0AjCOZh3ffK+h5UdGtfGG/lwScgZzl
         TIniLpn1dzCYAY60xL3a4LVWZQzvGZOVAANxCvJ6Kun/tABTOLtUD2MlFjAsk/q1ClyE
         OgTAA4qHryCPRkN2ctywwSdptXlFYLQvwDKgtu8HkCLJ51BT20SYz7B1197t5kzVd52Z
         njxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R1Asw47nW8KbTcIT5in3zyK3FGQv2KlKo6oaVI/Z6yA=;
        fh=GkRcR1VQCOUA4Git3UZVEiM4pltzhV1rybSCipMF270=;
        b=U1UEG0UDF8Hn/NtWWPz1zed+VYhKfwu3eYubieimLLQvviFcOMG5NhwtSMLECTdN62
         QJasO2D3WzkvVAeyHVWUHMWiIkbXGcXn3WkoWFtId2tLL3Whh+vzE9HaJRqh21sNeJbb
         XaVl0N1YIQai0O5OVsxvn8qSd5jBCdyHmgcnGGnlcB32jqAb7nO4ax8c1eL3lMOzJq8i
         TNCt8ByVGO731IJpqlMWKtOWvPOAEWiGKIFnNmUClcnNRghgy8yV8uIAKUdFbLTuSVWB
         z/ArwEkRPyWRBNxBLbtrea7k/tBOy+VOLJ2TZzJCb+g7ZxJk3uuNrnhTfokrlcl7/Y02
         orTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770644428; x=1771249228; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R1Asw47nW8KbTcIT5in3zyK3FGQv2KlKo6oaVI/Z6yA=;
        b=wVmlO7/c/GSzfyMCmKmhME4wSvfRsH4WQN0e1cbLojozqWPrMW+1uGV7KqY6fW0eFo
         IrVeuXkuC+b/MBsmxDugJsEJNB8vc/nz+dXEeO/aslFTKRxL0o7kj3hTeF56hBYBmTjL
         M85uVHuczS4dmxXE1BHXmNOZUcuTdpbRffmxYfrR6DfwqPcMK0N94JJRIIVSvxhDsaxm
         GbmvS/L692MsMmf3YcRDrWXovROPzHM3eUb0shWa/mTU5qdU5SO2uiNXNavlawKxeZxH
         Nlieu3NSNcIqYYsHMPeA+/LeYbNG1cWq35JoNU6ElSn5tdpxaOimZy/3dRu1pRxeQU+N
         jWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770644428; x=1771249228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1Asw47nW8KbTcIT5in3zyK3FGQv2KlKo6oaVI/Z6yA=;
        b=hgu7OoWkyQRQcxJkCZg0ZtfiMOF8bvXHQAE9NWlp2cM5nx1efSvIi1heoUiU9RVDIU
         nkGvF61mNfy4yc3RpVuTgefqfUmkvWhhYZUr7VBUY2CUEnvUNtYIG6wbSWWBfHUeWFvy
         8s/O8fti/4voK9BjZfwZLJIeR//FdsUgvDokGlnnuLRxJbGtujKlb5aS4i+hPorRT4wb
         TdLGCJQsyzp2arpD1qHgqsr9LdvEO+Rt7oM7ix8etk3OMXoFd15Q58Kzdfr2wwZgd1Fw
         LyhAEQOmhSxjG/6xyKmSku3VUUumxYSBSlkEu+h/bGM859yN75kYRuL4hzm6QoJ1SVFq
         0aLg==
X-Forwarded-Encrypted: i=1; AJvYcCVFi0ZmbaIEIw25PpPi1Jv65shn/NV6uEJeZ4KglanyX61gDolsmbcjHnC/abFZfOLlcErvw6OKmw7R/yPvusl5Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkZ4BIJ0sV/GBOEhTjWUdzUoYVRRzRG8kyijjf5bg0BjLcdYy7
	Jt8FdjFSI+dIGwrM8kw5AlvXlwqv9vGEXnXuGRdHWx4S2186mqmXjMXJ32VCUmddk7A6LKqcjqh
	xxMDazG/hv7YlpYO34mYCVcQGSzvxITlmh5EzsM6X2w==
X-Gm-Gg: AZuq6aJuR1GNPt8SikjYgMrcXRI2H2syqJU0nkMmjuJDrQwBA+dsvKofCRjXCLpIlEE
	JUZtndKsxQERehCvNTVyu2hGe6iwLCys9zMAqTgAXkxwYbwrc/pTS9WGFQFOYVARLENfvDP2LkC
	D090LmNSm0oKHqDr3BSMvdwqlFeBCom4fatcVFmUcCIlcLGIs2e3R1u7SKxB/0Pd+IP9k1ryEpC
	lfOsaSYnWNm1KmTTaZgraTS5bAokClm/ueGyCIO6rd3ewn2U/P2Vv/wlMBkdL24d7OEU4KLzjEy
	d5Or/d2fE6tqB7flteF7lntGcHk=
X-Received: by 2002:a05:6512:23aa:b0:59e:3fca:fd68 with SMTP id
 2adb3069b0e04-59e45049262mr3618201e87.15.1770644428108; Mon, 09 Feb 2026
 05:40:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208-rz-sdio-mux-v9-0-9a3be13c1280@solid-run.com>
 <CAPDyKFpbpcg3ei51hEcG5FzJL7tK44PdBcMbxfOdON7ozxP2Xg@mail.gmail.com> <9f49bf4d-48ab-cb8e-db39-3f573d20bcff@axentia.se>
In-Reply-To: <9f49bf4d-48ab-cb8e-db39-3f573d20bcff@axentia.se>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Feb 2026 14:39:52 +0100
X-Gm-Features: AZwV_QiBKZ8ysCcM3dIWhiLTRzG7BAEGejTSAtpE8_Z2Od0YK-CzC2pfzVA8zOY
Message-ID: <CAPDyKFo2Zm2LKP6=m=fJEbo1a2ZpBn10EGaucFS7zGfGJV_6tg@mail.gmail.com>
Subject: Re: [PATCH v9 0/7] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
To: Peter Rosin <peda@axentia.se>
Cc: Josua Mayer <josua@solid-run.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28075-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[solid-run.com,pengutronix.de,kernel.org,linaro.org,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 46DBC10FD22
X-Rspamd-Action: no action

On Mon, 9 Feb 2026 at 14:16, Peter Rosin <peda@axentia.se> wrote:
>
> 2026-02-09 at 10:57, Ulf Hansson wrote:
> > I have already applied for v8 and it's going to be in my pull-request
> > for v7.0 in a few hours.
> >
> > Please send incremental fixes on top instead of a new version of the
> > series, then I can pick them as fixes for v7.0.
>
> Hi!
>
> Sorry for being late with this, but as the mux maintainer I'm not
> fond of
>
> 028ec00381f5 ("mux: add help text for MULTIPLEXER config option"
>
> and would not like to see it in rc1. Can you prevent that some way?

Sorry, but my pull-request and branch was already prepared.

Please send an incremental patch on top then I can pick it up as a fix
for 7.0-rc1. Unless you want to manage this yourself via your tree.

Kind regards
Uffe

