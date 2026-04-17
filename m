Return-Path: <linux-renesas-soc+bounces-31343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEwLLG+q4WkywgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 05:35:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B6498416A08
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 05:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BAE5A30055E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 03:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A412882D7;
	Fri, 17 Apr 2026 03:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrxflrXU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4E81A073F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776396906; cv=pass; b=tSRhamjuoNmzkaaVByg9zVh8jzlGdB6QE6+eq+mQVrIqCjOCl09HzkBVmRmUTW9f7ESBAkV5Ie4dcTr7iM6cjen+ds9bg0p5J7TOaQUDquSzFril0Iee4pfmc+y/hDg8+Gba5f4FXZSwaJBcPrzrbfClFJKfRUggnhaYOuYpHvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776396906; c=relaxed/simple;
	bh=gF8A8r3ZdauI6VbTKUCHB/m1RT4UMpNofJUQpN4fjuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jM69Hz+F7eP++kwCLh+dxbaWkUibPeFUxmJWmOlPR6y1Aatt7cuKI4FgOL7Jl9OtBHmKJMhJMXIteruqCavKwnAKnEsOlT5s1taNujQRBe5KDJ+J8RUZa2LqhHrrPGNK8PjKzjZrtZGqQi90oCwsvJ0lFDMwWhL3itmzOODPUb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrxflrXU; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ad9f316d68so695985ad.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 20:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776396905; cv=none;
        d=google.com; s=arc-20240605;
        b=j5YxkpP+eVIfoxsAdTs6eD4L7W8rliotGOWOnRZ2WktAS53h5zz79TD+H8eXkrFXgz
         gjc1c9m5MlsUlNCbqsivsapWs4nNy538kZMNcwGX7iGcKpMG9VLeDlx+Te3xiF6Xpv/+
         0N8pTEg0VZljwWBAWM0T/fA0AWsYDIPcP+VITYc5uSD0utEh/54yM7bt3RnSeetnRfbj
         ykM87tQZN2JPietaDXI8Rb4zHy2ArPoL/+eaHEhDwlj73eUYqzRLMTTQJVZXik0uXAv7
         S+ZV8WNQ3wzqZucMM0KyAVQL50LYtdZhbQxwHaB3DGDeKgdqZNsuupu+Qe+Wdbiztzwt
         uGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6EtfNHTq6/My2XJcQXOgOY/gmVJF4Mgoc6IRrILkcZ8=;
        fh=UfzjHhtOehVMDlnb2lFYWBrgpO1ixd/AqasGPwtW36Y=;
        b=DZLHxd7md+RC/sVXarLltQMgDEw3VBLzBQroNRnPpTt+UBpGwaiGkxVnTH8Kysp0XM
         Zx9u+ueRIqa/K+TToAzNF37QTZyvcUsODGlMcM34BVtrM/ghWoSgfkQL7b4pGF6NiuhU
         qF0q8HFvfgjB9rYvsoe3yHIRCceK/s+12Xts+1M0T3dfUgYBUhjLZ3RN4TpCO7VqIQvi
         Pm8/HQKEWWlfTHohW/1LEfp0ChdoI1Iaf9VOudbWwo5ZOBSkxN/VuKQoLnYxs2HjRyGx
         zzgWDm3DPtAfrSPLQf3PrrGZRsn5KTblnYrPCJyE9awWbm/eLlQC8i+VPNzOHvI5UTcU
         GLvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776396905; x=1777001705; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6EtfNHTq6/My2XJcQXOgOY/gmVJF4Mgoc6IRrILkcZ8=;
        b=IrxflrXUAoKobTxdIMerywyCrtF15EjcFjGquxT77OG/HFd0ma6x8bS0tjpqL1spyG
         eIuqi+Xsn+9I+TRvzzZIpLoFgRUvRrWnhplSjOQd/rIdIMxTjr5BHriKCiafCdWZSd6V
         DYFxH7M0HXbK8UPiqNFN8stZsdK1sgwlVjcXJ1WxIhchFGA2k+SfgW/G+Jo8GSklFwpO
         EEeHRRqAOqXnvClf0NQzGW90r1pSGXdO454+udFMy244w0aDpOyTFCawBgML4WNoUlkq
         ErkMy+cYTFdDTu6xVDoOohR0uosm7w7W1KO2qZoklcO4AcR5fWq0XaRTnGsmqz6IT1W8
         EBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776396905; x=1777001705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EtfNHTq6/My2XJcQXOgOY/gmVJF4Mgoc6IRrILkcZ8=;
        b=eHWtbzgpq6ziJuuT+nNaH94Uc8m0NNbHINDD3p6QOXf7Ng/e2nOdWBDQdk8AzPGDLt
         Kxy9Acfa/sASfHEbHgcRWkasrFLL+Zw2usH1Xd/gEonVQU5+WWZtnqDlsLHNhmdOpCJu
         inePwNdFCDykkQbU9npJVmpi0wDogXIQOhw5auW0TCiuZfKNJ4NBCyisfRj030+/M3jI
         xRgusEF2/CsTyjmQ7CRK5JBsYDt9POcIWHGp7Ek2z3tKQ+t0B8HeMomAyt36Zv+oa72C
         ZSKIx93OWZzKplOUmpK11YbT9PhEy3pMojtV4Hetr6soNENZYyJi+WIBCm+dtkGK95fb
         ModA==
X-Forwarded-Encrypted: i=1; AFNElJ8tnsg7rTKdwNgQQdCX7wMHT9he/OtiG4QBDZGShlH+HRvDfllbYdYDR/zS8qw/JOGCirQTscGB7YIyUWbUHti4fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPHvWv+Q1W8NizH1yfog85a4LFA7WRJfOET14dLA4u1EJWyu1Y
	OAz0cWlK/590CUg+boM5dEhwm9jRNac2AqIaaDYwkyz65Sjkb2ieKLGYlAaYs3MOkb7NliiCGV2
	yembrJwJ+oL9A+Oqk5l3BiaT05sd3Yrs=
X-Gm-Gg: AeBDieufkWQMTURii7DsUIcuzt5oQBGlw/s85BZrDI0/yKerHVZq6AxVgA/jpeYfzXy
	23Nxw6qgbelyT8JrovsL4XkteDdNl+9uAZwTVP1g8XwZMUbHoAkJQYxrIKB6/Sh2WGuKGcMrEGI
	6aSKbBazfqJd4HwV0OEQ6ERgn9JVqfb5lxA6W6vBbKCDoU8hdDsSovoPQKblU/iRR9WUrzJvoHX
	VC9jz14mdsdTZZvNG4pKctR+fsKwAW9yvoN+GbiuSrjaibb51BazH/vlIkxBoCAn5kfjnzlN5FT
	ey7JgSzyg4RZeJs8VSz2y1lcVGu7WU7bFdfJxmpzuzmKRIiSvKvRixCR4uk=
X-Received: by 2002:a17:902:cf4a:b0:2b0:4b3a:9b4d with SMTP id
 d9443c01a7336-2b5f9f1c862mr11314295ad.20.1776396905005; Thu, 16 Apr 2026
 20:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
 <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
In-Reply-To: <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Apr 2026 10:34:53 +0700
X-Gm-Features: AQROBzCSAz4EcsSDgTBw_xZT_iFIxHM0p5jci8Pn2_CPreeChyeCa29QXqIGGq4
Message-ID: <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31343-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B6498416A08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thanks for your feedback.

> Where does this match the driver?
> Usually the functional clock is called "fck".

Regarding the clock name "own", I used it because of the following
implementation in the current driver:

   clock->own = devm_clk_get(dev, NULL);
   if (IS_ERR(clock->own))
      return -EINVAL;

The driver currently fetches the first clock in the list (index 0) and
stores it in a variable named own.
That is why I named it "own" in the DT bindings to match.

However, I have noticed that other DTS files commonly use "fck" for
the functional clock.
Are you suggesting that I should also rename the variable from "own"
to "fck" in the driver code ??
For example:

    clocks = <&mstp2_clks R8A7740_CLK_SCIFA1>;
    clock-names = "fck";

But from the hardware manual, MSTP refers to a "Module Stop Clock",
not a "functional clock".
So I'm not sure if using "fck" here is appropriate. Could you explain
the reasoning behind calling this clock "fck"?

Regarding the FSI clocks, they can be categorized into two types:
audio clocks and module clocks (which may include bus/bridge clocks).
The driver itself does not explicitly handle the enabling/disabling of
the module clock; it only manages the audio clocks.
From my code tracing:
    At boot: The kernel automatically attaches the PM domain and
prepares the clocks during device initialization.
    During playback (aplay): The FSI driver doesn't enable the module
clock directly. Instead, it is handled via:
    genpd_runtime_resume -> pm_clk_resume -> clk_core_enable ->
cpg_mstp_clock_endisable.
Since this module clock is essential for register access, it must
always be the first entry in the clocks property (index 0) so
devm_clk_get(dev, NULL)
can fetch it correctly, right?
Please let me know if my understanding is incorrect.

Best regards,
Phuc

