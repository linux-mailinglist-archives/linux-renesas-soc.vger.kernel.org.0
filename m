Return-Path: <linux-renesas-soc+bounces-29172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGsWDbnusGkaowIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 05:25:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3EC25BF56
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 05:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88C8F30275A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 04:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092CF2D3ECF;
	Wed, 11 Mar 2026 04:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULejNhSc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDB62C1788
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 04:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773203121; cv=none; b=fOBoJYGswZ1cJWLqh+47gSEO3IcN1P+JuBjb08HjIhJa9FPGyeC9SDfunkiGHakXuXehOETijPitRjAdvxsj+lhVLKXyRihbOniekB3AzshuSjkSm8JAl2himpg+2LQJtNn7fAz4pK1LBQl0u8TfLnJ5CkUHP5sslapaaAbTD1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773203121; c=relaxed/simple;
	bh=ay7kLC7nSOMoueeuZ07rwxwG7DCmth5fcpnKLvgPIH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XGxkNTNYu2nq46+Lrw17/fVZOUsbfCrAu8gzhAkmTsv87DG9MN7he3NFpxKO+ey2JLJLqL/T7KxjkYWtJsVaBL8V5sBcaM42a51ml8Glr/7rKa2uL8/+e7joxmfml/xqhb+QXtaGTtN6jVE+0X5Zm97xAb043HcVlBSR7D1uE1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULejNhSc; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-359ff894f0dso204617a91.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 21:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773203120; x=1773807920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ay7kLC7nSOMoueeuZ07rwxwG7DCmth5fcpnKLvgPIH0=;
        b=ULejNhScN1UcAPrEvNAAuintkrPizdGF4EJi1g9MuM9X0aaj/tRDAsUYrB0VfRjH5F
         UrxJ4GsQ3cNVwgHhVo61ZSUaMS4YAX6gLLGYpTpHC03rHO66V7yQSiCDS8HP4s4+nWhE
         Asx2gbOYpQb7ux5qlqRPvG6hL+z3p8jUS2HFHVow1BUy1gji5HzUi1ESwW/3x4vDATIh
         Q8PJtCVwXpkFHwgDuXAX8rcoFKQvi4/6eU9GHmQb6O2s7OXQiNs0uIb7t5TOdviF8lHl
         1m+nAKrpPTUn7uqeHASeSpjIWRmlMKx8QEa82HZAYyn89mN2AjiYbsdhcmu9XHCYixMT
         Dvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773203120; x=1773807920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ay7kLC7nSOMoueeuZ07rwxwG7DCmth5fcpnKLvgPIH0=;
        b=s8Dx0DAn10O/bs9QL4g7cMHVln5CZ0oR2T5gUMA0ER3LVJ38dBfwrNy6duH/Mx8llw
         Zq9ZP4rew5jUXg3QVkmPvdmuFA7wbly3Z6LziWpg33U6w2Ud+LzzaSmI5X+6tlGMN7ro
         LW9XGGFQ2jDfPRI16XU+up19Dyw1ImLfklJ54O/Q2wpbMqej2+2v1eKrpYTs9qFJ8R7W
         KVk0sQohwa0vgXZVmTNSbnaKLMy6XMMQx5kqbwaK/sFAUxESFH9c7AltYwJDd80ttWK8
         cNnIWEEHva1snftrrNUsbnkTuGdAp1BKc9XqtJcoMBI6pQ+uQdGMx9MmXswIARpEcKvh
         Jf7A==
X-Forwarded-Encrypted: i=1; AJvYcCU9Lnqd+ntGo5IDOVW/8w9Humnywut648Jq/gFyKYMRc4VraU0gsJbug9yri/ncYvdjygp6GWBfxql8xBWb+Y0+Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx2zkCG4R2q7i10cFGZadMGcIaF6Ygii5rX7lZ5wZuoQ08NYra
	yu7KPykwh/x8mO11jE1uXWs8itM/vpI2gV6lmSeMEeQYzecV0By63Xqx
X-Gm-Gg: ATEYQzzj85+8PXyVEFwhtiNJ/D4qLgmKByYIqRUk2e0JUbJ8f4JN1mhblucAtbGgcqb
	vH4rKac0aAad5XIAaMaBxJQqvNsfrRZ928d2VsF9RznTaQQoB73ktHsp2MxdE2u2r5gJV6EbyOp
	9bbF0RWLO79HWo6eyFKsbK0+yMawdYynT2QjyF563SVl0v4n9UeOavH5Jr0e3UTm2NWxIEA93ZT
	4tWtxa6SyF2MUm5NA8hqsnjwH3wEdtFv0uSbBwBY3SPvZyW9owX0GTg7dYBlqTDAv1bt3h1Rqi4
	zvZvcKf3qsOIPB58+hNLtPIkb64Fqpr+opzRz8zqweQKhFDjtNPS3VBVl3Tljo9fzWZuc1wMYCr
	nETL/3WBplE24+pd6fW19NxMWH/yzh0fL8h4MFrqJaEiLwmDurlhCONXNwaz1K1yQ14NkHwvpGw
	AbdIoDwLG53zVwpCx+bdJzBGLVStBNUPga7TE3XEIlTI3iQvPRjpiL57I1F82k2R1JQ79pAr2pf
	hPQFDRa//Q=
X-Received: by 2002:a17:902:c94b:b0:2ae:456d:b843 with SMTP id d9443c01a7336-2aeae90b61fmr13064715ad.48.1773203120198;
        Tue, 10 Mar 2026 21:25:20 -0700 (PDT)
Received: from localhost.localdomain ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae361a00sm8316975ad.76.2026.03.10.21.25.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Mar 2026 21:25:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: dmitry.torokhov@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	hechtb@gmail.com,
	javier.carrasco@wolfvision.net,
	jeff@labundy.com,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	phucduc.bui@gmail.com,
	robh@kernel.org,
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v4 1/2] dt-bindings: input: touchscreen: 
Date: Wed, 11 Mar 2026 11:25:13 +0700
Message-Id: <20260311042513.2434-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <abCqyU2-iQgcghzy@google.com>
References: <abCqyU2-iQgcghzy@google.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5F3EC25BF56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,wolfvision.net,labundy.com,oss.qualcomm.com,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29172-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Dmitry,

Thank you for applying the patch.

Best regards,
Phuc

