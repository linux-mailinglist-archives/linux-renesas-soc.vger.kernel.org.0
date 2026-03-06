Return-Path: <linux-renesas-soc+bounces-28923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOjGHtqrqmnjVAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 11:26:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB88321EAB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 11:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 590793055C77
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 10:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A080837BE62;
	Fri,  6 Mar 2026 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/OhqbzQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D3437B3EC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 10:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792688; cv=none; b=M8AvQ48mJf348mDmduj+b5MNw3B71fOVft4ovYCkd4s9IJWJ8VEdSKwnLwjhxGq99wohW/9hqb/WEQllKBbZALg31Po58+cK/3ZlHXAE/6DIs5XTwfb6ZL8B5Sj3sBvwR/k88YEM0HHxVSo3vzD+Ssl/a7xq/cLiVU3xto/DBh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792688; c=relaxed/simple;
	bh=K5zUA29EOHlsQwWG1ZLNtqOq3eZuUrFY697i5ltzkG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dAruhNxjEbtwSlqZG4RXaDylUjkaGvLvqunm9RyejWOy5VOAfpNuWFdie17/ylgDw6eqpgxvzVXy7D8yvQERXua2GRFtMCI9FidLI+XMU3f4H0/iQL5lKQsOdEz/v3VZcfqEB5/4Zy504qnbcb0WZX0t9rpjrqB9aHzj7HjdfBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/OhqbzQ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ab39b111b9so42550265ad.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 02:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772792687; x=1773397487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEdOKSA16mhhtBoc0MBYDqjTPTIP+5b6vp0xDmyG/4I=;
        b=W/OhqbzQOWHEOD3x12R3uP0ykfPaFFJfhH2hqy6LFEETNuLsrJx0yZXJN28WiJKvim
         CK4Fm1TDHq01ubNWPm551nFcKPyn3wmveZfcJOZfqGfY5bxB6DeWDYcEeUjm0zMAPsa2
         HvOdqzdA1XLAdiIfZprpNseo8TTq7jKb1M31IUHQHUDNBO0RpldyMj84rFEe7yJdMbQJ
         /Yer5gDUpnYl8aTuOQSsafGvVAlWZLYlM17OyqK1lVGxby5OPPZvSmewP/GaAlZYtyeS
         6LWy6ZNou6oUkfiUH00i1Ib6swHbrSaqGhniIUTGUSRFeuRGWikfxnYlDmkCRpRqr2ar
         ldGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792687; x=1773397487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MEdOKSA16mhhtBoc0MBYDqjTPTIP+5b6vp0xDmyG/4I=;
        b=FbShrtrNR9vtSpF90wFIa1UmAg+dDFmxVJukNYt0jNBDrRYHYXfah+rl0kAaJNtyla
         5aDIGQlYHSgjNKSS7wKnTvuuTaI+ivcMi3bwtaFNfRgaaIjinXU8cUe3mg7dmz5vstWV
         qpBFjEHsgGuYkUCdmB00Jo9Pxfg7zSkHoXwh/p3BKg/8aLmz+dEIvP1aXdFs3Vnqt2MU
         OkIecwrKAYWvKtTvC2Fjib3y/Ap4XisxzXOzfXa5WpbDU8gi6XyoXPv70jr212YSMwjq
         Xy5A+2+dPuaZS2ro3xuxfChvvmBKDSMgqz1e34m4uu+2xLAyHogfYVbj9/ClX95Uiv8u
         QSdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM6qKvIfGMhRqQVxUiXqVQw33+JXK69cmpV+oV0ceRyoRpsNhiA6kQ0hlzfLlEn/freCn3SYqN36I86palfY8Nbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEmFLJICypWmedWjq31yTwjh1djH/w47jhhNjxY4/F93mE0dYb
	cg6ohYc10QbKeNPVeqRDTVOG1OarMDd5AtQ5HpeLEYexP6uPOvvfsqy6
X-Gm-Gg: ATEYQzx2sC+Dq0Kan+0xURENuoYUFmjMpmKkkDxiwbwiJATYkr7ykhgUfDKVIWertNq
	ctN1ASMK8Pdwr5nlqAO742n74L/2W8R1EP6hdltkmkCm2cNS5EX2LPd/obRSAHny5GWuHtizX5H
	mWqE8ZhjChSElI3NFDrjwXZ5WkWjf4ujjyv1DK0Eq6IPTazirmPkc06NkKtgnvYnEPjwqPP2o3N
	op4geingA9FmypIOzp+rDyb8tDZ/Udohtxo43xNVYr9B+u5Fo21sJJRxqTLhTbjBd2HsG+4V5HW
	JII+0CSKSBQY8zKupsm+UAVvxyJBSkvUWsjVoeUqEKXQu5fdMFNz9mLrFWzCOPhMOo4F4AkGrjc
	Abek6gxnsWfAow4j6goO/PCZQvukMAN+vWOh8ePZGNEH4sBWDfzOWN7Eo8WOBjUO6oPWWgDi4Nn
	nNgqSnqBRCCLHG9jd5p7ryEtQf0QPCwlpJvOwKO97XfensConlsSXN8YXWfSPqM6SvkHoJBwLWa
	MjIO573r/Jp0woUFY3/zg==
X-Received: by 2002:a17:902:c94a:b0:2ae:698d:94a6 with SMTP id d9443c01a7336-2ae8241dd3dmr21919975ad.2.1772792686854;
        Fri, 06 Mar 2026 02:24:46 -0800 (PST)
Received: from localhost.localdomain ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f770ffsm21667495ad.45.2026.03.06.02.24.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Mar 2026 02:24:46 -0800 (PST)
From: phucduc.bui@gmail.com
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	geert+renesas@glider.be,
	hechtb@gmail.com,
	javier.carrasco@wolfvision.net,
	krzk+dt@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	phucduc.bui@gmail.com,
	robh@kernel.org,
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: sitronix,st1232: Add wakeup-source
Date: Fri,  6 Mar 2026 17:24:41 +0700
Message-Id: <20260306102441.3605-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20260306-fossa-of-unnatural-authority-29e0ed@quoll>
References: <20260306-fossa-of-unnatural-authority-29e0ed@quoll>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DB88321EAB0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,glider.be,wolfvision.net,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28923-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org]
X-Rspamd-Action: no action

Hi Krzysztof,

Thank you for your review. I will drop the description for the 
'wakeup-source' property and send the v2 series shortly.

Best regards,
Phuc

