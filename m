Return-Path: <linux-renesas-soc+bounces-29173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJZqMdPxsGn2owIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 05:38:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E24725C008
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 05:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88AA6301AF5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 04:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9698E2DA76C;
	Wed, 11 Mar 2026 04:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtK1JOGN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFDA19DF6A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 04:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773203919; cv=none; b=mk/6NksrcX6VyVIkJwqp9js5314/xBbdckhWKYD2hWDhS2zBtGQ6cFCfIP3QsPD/QzI176BlToXoQTbUZ5j/7G4XOh2I0p01KnCrVrpgExsQuKxgyTlqLunfIHJjxkMxkSnFvRSF+j6Z9DIYm+zQSkY7xzg3+ZQfo5blp0HatL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773203919; c=relaxed/simple;
	bh=b73m/0G4bp9qlKbyGpXs2BmQnhyq68YsG8re+bxd7zk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OOvSvTt7KxS7JJOQWVaU4Gg8YDc6MhkqL8B18YIXvZHjbG8ToaMrCXcNaz46vsHaU4a3yxSjZGVufULWQP1OaWB1xUZl6dgfeNNyqM3h2S2cehHqgaRqNtof+JIONlBQKejNlYCHJd/vY0WKsjqNnWHQ7mF+0o8doD4kTnTZw0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtK1JOGN; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so8355661a91.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 21:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773203918; x=1773808718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOpJyc/uxw9YcZ5bYmcC7bF77XfwHzZK7dfWyiG9If0=;
        b=mtK1JOGNkUqANef7tcws9FG9uYdBx8rECyqe+z1NGsmn/MlG8YoLc42wGLz/f2Hnkx
         maoAr9hnvvC4zKx6qJL6x8QFH5tXsbCHt4X4GsY76XrAJeTCSxrjKlcydGzA7ZCavOVZ
         o9+aBhEwa8+tQS2gqSJrtg3adUCkLkmLp1Tr5h3fk6McCvVUnjKbb7u5uzqIaldZe6am
         8eUy/nbiM8O/r/raMQgVj21LKlbJDYA/ySlohnBhIeFRFh1tpOKvn0DTBPzgcsLK457r
         HX79GxnfpwQ3jHgGPGum1Lc/nLNPrqKQOqtD7Tqf2RXZ0bo8PPcl/BonHkzwYfGhU+9A
         PJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773203918; x=1773808718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rOpJyc/uxw9YcZ5bYmcC7bF77XfwHzZK7dfWyiG9If0=;
        b=fhi6PlAvRHykMUSo4orFO+v7qBWBlyi5nvOfsFJW1aewtZCr5UKrixSRI0lC5pYB9O
         Z+5oayPTl4I9Hef+hf2qrSzx1sGCUe1nrNc3V+iHwJ3JuzyOgz/m1NS4nU9jbnkmz17C
         l7axei9sIPLPM8bvAQzSViLweRH2VkKq1GDVyuJUO3EBFlzfqTHAZCeh05gmsrXlYLYz
         LFJvYv6fhDXJTbrRdNMN1j0BqknL6ntRPrYPtnZzkPrUwfHa9uXFRMuRKG/pVfRd0Rtb
         VrTfw4g182HLMz+zVB/hWetR9g43VIfj0gNd5+WVEM0hSj28rA3lM9kjIwBc5wISWbR3
         ieHA==
X-Forwarded-Encrypted: i=1; AJvYcCVYP3b2REvwDYA7V6UYXQu3ApEW7Nkm7lnGAyHf+zMoulPrOEQEOvjPymZvnCur32KxzPAJxqaHjh2+SiMoXUDWmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3iJXchnkiN9/Q+AYDvRv8nrNeS+nD+DOoDJ0OTA/xJjTb6+YZ
	i2PueB/x1PqoHFi3O6iHxoXgTPDfTfPJYVndDr6CEqgEnlBcRq21fWTJ
X-Gm-Gg: ATEYQzw/NeoAoBRhJz/BGP9kVrDtpV/SHuHxgqGrEa6xs444BA/QLpWAuO4AE8uGniN
	c2vfPzZrY7KbuSCosiN26vLO0VWw6vbZGOy3ir4wMRlR0YYH8Gsu+O5Klo8wSbyWLXK/j5ISDJa
	/Es+6kNDOM/zCuftIhnrUZXuvxNSy1rnFCfYxSS+lOzxm3B6lvByuaug4f0ZubiOWp44a4YL5RA
	mSgpKmrlJA5ck5c1gVN+TbipjJTEwTG7n39aaM/bF1/+4GzKNYx6dr9OxcSZPN8sK1gBtzPe6I/
	FvmrxrcXum2e8VVxQwB99vfUJ6Ok/7/+xeNN3TB/YqgJSoWbuVQMydJh8QFM6cjLYLtio0TYAQH
	8egezG32sxCZjLdRuNmIMxp+qu4uv7fFLoctmWSxscX7TCDHx7MAoxSWPQ1zYtEALkijW/Bf69z
	tsgMCEkldRGfQ2qR+orqQyLRhlNMVwJYLwCsFTiHjrkE9r0T/nBUtFHb42gmavYOyqfsExNmLa8
	R4YRw==
X-Received: by 2002:a17:90b:3c90:b0:354:c6f3:d365 with SMTP id 98e67ed59e1d1-35a012eacd0mr1283571a91.17.1773203917898;
        Tue, 10 Mar 2026 21:38:37 -0700 (PDT)
Received: from localhost.localdomain ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f06fa04esm4679484a91.6.2026.03.10.21.38.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Mar 2026 21:38:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: john.madieu.xa@bp.renesas.com
Cc: bhelgaas@google.com,
	biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	kwilczynski@kernel.org,
	linux-clk@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	lpieralisi@kernel.org,
	magnus.damm@gmail.com,
	mani@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc: 
Date: Wed, 11 Mar 2026 11:38:31 +0700
Message-Id: <20260311043831.2576-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
References: <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2E24725C008
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,bp.renesas.com,kernel.org,vger.kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29173-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

I noticed that for gpio-hog nodes, the kernel already uses the node name 
as the default label in /sys/kernel/debug/gpio if line-name is missing. 
Since the node name here is already pcie-clkreq-n, the line-name property 
seems redundant. Should we remove it to keep the DTS more concise?

Best regards, 
Phuc

