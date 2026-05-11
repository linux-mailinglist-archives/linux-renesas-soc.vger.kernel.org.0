Return-Path: <linux-renesas-soc+bounces-32392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA1GAMX8AWomnAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 17:59:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41264511B31
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 17:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A18830B3233
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 15:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C9C40242C;
	Mon, 11 May 2026 15:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a1ukhUyj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F5532E137
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514046; cv=pass; b=Uu1hgFBdyT1iIiD7WNNlNT2eg8SU3aBLTdYpCIqNd7uAZDVm9t8ZXvzTz3a8toPAhUWvVrLY2x+AA1rjDIrdDLLkVqXTyaNLsiVhpknAjr74cUVbA0hCU6gOm5VmzloVuF26+5T72qE88Fx97yoNGh6R/9Lb5RNL2LWfyqnewt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514046; c=relaxed/simple;
	bh=pYW7RgYPb/aitZu0xIOw+1rg+iW8B1yMUnmb+fIb5/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iB0zrJ7fL7QpsQv5BWT5GifnuXcslC9Ck1zKY5xebr7E0S6Go/ddTBXY8pV7IRI7VpKmSH/h/sXbEMPYcZEJZbRTLRH1e+Xp24ZskVXnoufVxffNWcrmTFjCNwKVQz5lc1YvJTfu9rrLNQgTZFHoDbbRFsXz/28uVT2rsLlPDZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a1ukhUyj; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so4556013e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 08:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514043; cv=none;
        d=google.com; s=arc-20240605;
        b=NPjzxyoBbrWPbrGMNGj+fKudShelUdoQb5es6fK2GBbzgwOTUZLQJOudh3vY/f3e2U
         x2N50YukCBNRIi3OevvdPyfa/vE2z9iprr2foa52cpGBeEjuCFlptjYtKRHxcNcoZ5f4
         Q9KPMQqEyzGfcjuUyKOTwfSu6fvZN1FDnHds2DYPAArrqYGDcVt4CYVqgf9aDSq1tHD/
         g4s1BBVfe5hnsPGh95f0cp6kTgZ7Kv2UBZeI79LFQRPqdojaP7G5zw/0xO4dlyslAXYX
         Fq5EEfVK3Wt2j2uEry1K6TBqBV61X+0AnX94L1PloFAKwmJ5zSLALg+DlZkivd7sQgYd
         faQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KjChFc16W6YK3fibnourBR78yR1fv1+j9VkzA0wOe20=;
        fh=zEK7iNHNqtiGF8Rcljc+xhYdvv1xVTASY1eCMSFAS5I=;
        b=K4T4izSPg31Utfbvj4u3wqZGbP1psgAgBFL8G4kOEFQLxFfhhEEg6clX9u1Btd+ETv
         3SePaZ2G0cCLMBYebjeX4DL8xJgBuF9OrkKfX6ena1l+zM2y/GVV0W3CxzA4PI9gWE3H
         UgqCm9CXVBqlXt/CGgguwpVaQFOM9McD6EjcN6+n5SeNkk/TrjLKTW9MBoSAcAE3yJ/f
         lAyNWJC5sMcFwwOPRLva4NjOoBDi0V63uVjXL33JJDqCqYFGxJzzG9yTHJrv9pNGMNa5
         lrhdwWPUjIAkn+yn+57emPtKoUccWUZaZym4WEFBNBWGn4PAYwHJr7ZXJR0voQa/VxGU
         2d7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514043; x=1779118843; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KjChFc16W6YK3fibnourBR78yR1fv1+j9VkzA0wOe20=;
        b=a1ukhUyjKTE726gtgTOMCKf7F2deXxfK6tsxGlpzHMG8+Y9nwqBOPk22P+dBdjBAqZ
         VQY/tcZmrT/V96CPMoa6RpKNHns/Gs7dHkzATxu4uT9GTXIqe8FAik6fmzjlpcDOnaM1
         anGAfKQZLGP8sIcksyFQ4005gQq2kh4cAZUmRA73VVejE7wXfJLvL2vbnGN1Zkj+UNWC
         PRGZLgJT640sCFtr+VBw/p4EF/kHT1tQ4fIzWhq3bv8xZx7t8sY/DAR2wwRCOvxZ4+T/
         XCXbXe6upsLV2UPk+94n5aaQvJk5IeuGF7N/3CMVAML1xO7qbdbVvICvIsrfGmm3iqsy
         eSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514043; x=1779118843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjChFc16W6YK3fibnourBR78yR1fv1+j9VkzA0wOe20=;
        b=DKYQPVqlhcJlfEW6/qORe63DlddIKNpR/bJ5YP9xlxBj+8GzS1dKALlxUDlJi6icH6
         YidsctbaK7LG+It639knA/RjAGoBaHWGllELMHhLR055x/C2m6K4QPr39mFBUMjkILFg
         OtmZClYRMPc7NcUTZ60x2QOVHGRPlgbufjRnN5aNwBwdl2cGYx9e/vLvbZ7aPpmzSEiZ
         pDtfCJG8X8LK2TpjCdlSsttiz7gvw3ZsL+DiPhbYnQowMjFjrhtN2o55mQXsa16jL0Ai
         dgmraS1qXqMhruz8Q38EDAwgJNJ7YkO9xyoQYkD6WSfx9p9DJ23/EE/x1jb68MZM/hHS
         3NuA==
X-Forwarded-Encrypted: i=1; AFNElJ+XmvJOodOZcqzgQAQ9kjXwqg06OaImt3DXb3bsg02TChQvwdm+huLgKiRjkB6e4lTuaz8NSerm1VDaisEUvcjwVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOiz7sQfvN6c24JGyah/4PDI4dAzujY9e8wyD5uOfr/jK/pC/b
	XZOhwdaCVdO5zAgaeIo84zIC96Yd/NPr7JDLTA2O/g4679lQzaxMliINmGfvl5AYmg34kCWYWHP
	mc0MmN+h0GCX9Sj0rF3I90WESJGxGnJDc17u04f9fFg==
X-Gm-Gg: Acq92OGc6yzngilOUqC8aCLdyCjKKloiL0lbSCt/oECkXbPJes7UJlFt3oPWaf5DQg4
	blCpLVQe+X4bnAEbre6VUPF8WFbUv8ee0dPZKYt+m2I4GIpiH9DNf8xJ2QuFVw4Pwk93qCTlC48
	bS3odB4ANZnMBaAp6reJ9xNr53b0jC9EV4mxSRyaqAYQyJK3/7rlbB2hDI4Dn+qvM+RJ+AK91bp
	UBtNPsEty1LuptVIePczvvoAFpgsUGYz7vSy3xoC7gXu3pTyv6xK4Su9t2UjYhOat9r1A36VDUk
	DIaW2M96
X-Received: by 2002:a05:6512:3a83:b0:5a8:6e64:e88b with SMTP id
 2adb3069b0e04-5a887add6d3mr7544636e87.4.1778514042559; Mon, 11 May 2026
 08:40:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-2-marek.vasut+renesas@mailbox.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:39:49 +0200
X-Gm-Features: AVHnY4LAe4jSY9ZIU0Jqqg3bAkBng0JF_5D_OZzU-aQcORXNKnNE7TuCtsiJ2MY
Message-ID: <CAPDyKFrDzA-dYF58_N05JCTqdgvPUMvXF+FKeyCFivLyhw5_6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: mmc: renesas,sdhi: Document R-Car
 M3Le support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 41264511B31
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32392-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[lists.infradead.org,redhat.com,kernel.org,glider.be,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> Document support for the SD Card/MMC Interface in the Renesas R-Car M3Le
> (R8A779MD) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - New patch
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 64fac0d11329a..4d66966ce2900 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -52,6 +52,7 @@ properties:
>                - renesas,sdhi-r8a77980  # R-Car V3H
>                - renesas,sdhi-r8a77990  # R-Car E3
>                - renesas,sdhi-r8a77995  # R-Car D3
> +              - renesas,sdhi-r8a779md  # R-Car M3Le
>            - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
>        - items:
>            - enum:
> --
> 2.53.0
>

