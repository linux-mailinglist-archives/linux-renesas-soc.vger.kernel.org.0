Return-Path: <linux-renesas-soc+bounces-32675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL2LIOr7BmrtqQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 12:56:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AEF54DDAE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 12:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA9C8315D54D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 10:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D809444E052;
	Fri, 15 May 2026 10:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuurZDBr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A4450903
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841683; cv=pass; b=CGq33O62KUmg8Yx8K2+wnI5w6aPUK2n/JmYBrFpngJnkiyo/NZCPcCrvUu+0swI2hkVpKzLO7n+CRzUzUqWRtQUEPd0kHwP+8CLSIFePYdZaRxMuLgEN7tMrGx9TODBiSnieo2yvIEVv+R0usWcctQLtSB5SaxACwx3Yueuor58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841683; c=relaxed/simple;
	bh=uWjZEP+DdLhFjkOHWhU9mixg+UBZSboIlbqAUS3d1aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExlKZ0LpxDogJ4mtMpFtKYhcVDaSUb6SKSatJDciBFpeZV7CVz3dUcPtuNGXgFbWejhtfw/C25mFYVmYsoNj59yF7v/E9E9yKvDi//wUxoLyYUsuBi9a3T3AQVGAFmBUDc1aBfEZMB4Axmvj/w1KMBil4eHjPRYUdanslXEyi/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuurZDBr; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bd266f6fc0so17011115ad.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 03:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778841682; cv=none;
        d=google.com; s=arc-20240605;
        b=QAnxt7XwGXcw70x/ur3YZfYNdLlKPzf2qTGOxyhI70RsfmWmNNUBTez8nX2ohpbHv/
         3ct176vSNc3QONwGXiztWcje0qQrkAhjP+JqK+m+UPJyY7dx3eR/xfoCHBX8TsqqhzB9
         rGH4Qtc8vSx+EJHn3aB1EGp1gHDqa4h9PR7QBGPPXPLgGvkgyhV4KhskTtVBnMHOf/yC
         8SJwPZATJmAqUr4azdOPwT0i0vD+pJCQyJpzZgNwwcOs/jLUZxKGW5QLzuAqM8WkjNGY
         00zDgn8Ls67pQmLkW10XQt8qnDFCUhWBT71LLSJhfxn2/1bPqGP2OTXbwogXIulXj/pJ
         lWCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K7Caqr7qda1JX5f2kJScSCqvc8buFLXMwvA7vb/W8s4=;
        fh=6oO/kdY2ingfBR64J07MjFytNiVm39CAP5DUussgKj4=;
        b=TogBpgp8cxdDEm5RxOzo/vJbTZryUw857S8qv6f3qkkWsLLJFqDUrFJlmd2vJUxzmi
         ywCodZXt2GHPcdLkkPxRk2BTT9BR7frH7efTxtEFn95j1ivJj6+25Lh5jcD/F3A+jvfh
         BL++NtVK5FSq7po9IvVQQTMnllLd3IKGD22WO83E0m6sIg8BDAtulvkHeLXyY+lo9kiM
         7g+5vIwOSmn3qUl4gJKVsQn6nVGGLHTDx9RkWYXUReEeEO9ApoNclPJNXp5pXridQYlB
         lj7zRsL9Ip3mnIpLej4+KZ07twhxz7ZJOt2wT9LCV8TKksJqNGgyyMLcv5k/y75KMnb0
         YvxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778841682; x=1779446482; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K7Caqr7qda1JX5f2kJScSCqvc8buFLXMwvA7vb/W8s4=;
        b=YuurZDBrTzdTOgVAWPv6LcSHe1/fYliwIUG05x+DUJwh1k/i+HjcDzDWGHTyr7UE+1
         GOFiep89ImUWa30gDO0rI5U6NoR2RyzwUf1xcuxzHcQyqvtmXWG+Cq3pwLBL9gPONOw9
         R3dqc+5e94T81NGYHze2Sla2Cvq8Fp9p13jRx1xt5x3G6af7q9e2vawJbaknpW+BGw7Y
         Ku2evwzs9FKO3A3+V6UKgWs3nBwkIq7cOsyBaAHa13VAz82b7CKyBlX72mtxnZPSPiAn
         Y1gm5h16kNT2UkN1ERKXi0UIj9O8hyGS1G2LE/2lPTG3La+wAJ9CjG9LWstFTRdqdJg0
         Ifxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841682; x=1779446482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7Caqr7qda1JX5f2kJScSCqvc8buFLXMwvA7vb/W8s4=;
        b=kT1aiPqVLD7jQJlZZfj73QlrjiGNCw4eluif5EQP7bLUCz8gwhokXcwGQUNLFfBUMe
         qE8w7w4OZQi27k4yJ85zxmc0IGP6yAAoS/JjQ4Bk6Ns1qBgQ+XAm6f6bYVXmEz5WtoLP
         7rl3H/r31W4+zcfAg84ZXk14GKb+X0+FuQDYX58k5ZdgkIIKdCiUqxTB6ZV3ipkFsexb
         WHwWx/E28bp4U/LCw8Sa8LQUt8NYckATfcdz7LcikwVoauBb3BUJ6aI497vMF0A3aGKA
         lA8/X2n0ZO00Y8Phq48bR+YLD/zbd0ZD97ePXVY8lNeTHIj74fv95/5VJdB/Wekcjgp/
         gdPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZJCU9tOBcyMFC/VDKomRJC771M5I+/7s7fDnlmoTNauYKj6B/nHgwDZhaT73FyOySs/IsgihVfXxClR4Sgta6jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiq2XWzxK6mjGwS9oExjtdIOXrK0gwvzINmXXBxJK/KMJniLc3
	sFtWYw17SU1Fqbd+cvElBfCJj0cqcO6B6rMapLY0yuMKRnUHT22m7Zpy6OlRgPdbSIJwlo4wjqg
	gO1v+kmNnoICOhOpgc8tF6ZQEsMZKMAMlYDWx
X-Gm-Gg: Acq92OFV5oGQ4iT32q0Rj10G/7fMhKGkO4VnocOBfsd70IRf5gyC7EsWEnyGgjXhj5k
	87p9kwz335ppFbF04gVoyDtVpFWbUwN+0P/8SKP7hCMEO6zJH1OckRwoAiIILqVn3aVHlldlWzb
	KGSwY9mpeAdyUjShf/8y/zCqlKjD2zdIR5TAs0CPc+9LoTKnkMI09uaYEl+fTGtmewd7xpYUBzO
	smhJtXO9Ln4eAYS5gYF2O1DCxEX6xBMmm8jFvBzRPlwsUAnwNfXFfT+gkA8vnizeX3T7XB8FatP
	Dbawt5edeH8HfYh03z7pztg+8dgD2JZQCR5HiP0lFRbhIkJz
X-Received: by 2002:a17:902:7c0e:b0:2ae:826f:2c50 with SMTP id
 d9443c01a7336-2bd7e8acabcmr25677585ad.12.1778841681720; Fri, 15 May 2026
 03:41:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-2-phucduc.bui@gmail.com> <20260515-transparent-calculating-ocelot-bdec04@quoll>
 <CAABR9nG2YFq2kNsXbCe-7XUNJT94rUMBz6hruC97aE6JFSP9CA@mail.gmail.com>
In-Reply-To: <CAABR9nG2YFq2kNsXbCe-7XUNJT94rUMBz6hruC97aE6JFSP9CA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 15 May 2026 17:41:07 +0700
X-Gm-Features: AVHnY4Il_zg65aidyTXrQxejhYWBVSEG4jnBzF0_B6Spst1wAx7CbwetRxJz-nM
Message-ID: <CAABR9nHE7+xJ_nPuaDtE8z5fzUfzSMTAJfDRLOEpudA6Rv_OUw@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, 
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	magnus.damm@gmail.com, perex@perex.cz, robh@kernel.org, tiwai@suse.com, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: F3AEF54DDAE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32675-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com,linux-m68k.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

My apologies for the inaccurate description earlier.

> I see your point. What I intended to describe was the internal divider
> configuration for Port A/B within the FSIDIV block, not separate clock
> representations in CCF.
> I will rephrase this as:
> DIVA/DIVB divider settings used for audio clock generation.

In terms of hardware, FSIDIV is an independent block from the FSI IP.
It is declared in the DTS as a separate clock provider as follows:

+    fsidiva_clk: fsidiva_clk@fe1f8000 {
+        compatible = "renesas,r8a7740-fsidiv-clock";
+        reg = <0xfe1f8000 4>;
+        clocks = <&fsia_clk>;
+        #clock-cells = <0>;
+        clock-output-names = "diva";
+    };
+
+    fsidivb_clk: fsidivb_clk@fe1f8008 {
+        compatible = "renesas,r8a7740-fsidiv-clock";
+        reg = <0xfe1f8008 4>;
+        clocks = <&fsib_clk>;
+        #clock-cells = <0>;
+        clock-output-names = "divb";
+    };

