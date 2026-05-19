Return-Path: <linux-renesas-soc+bounces-32776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFwCDzzNC2oROQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 04:38:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 534D6576781
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 04:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DFFE301E59A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 02:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8AE322C77;
	Tue, 19 May 2026 02:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ny5VERZm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A413115A2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 02:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779158328; cv=none; b=aCEs7Pu6DgCb8FMrwkDKoT63GVlTK7Zlu7cYmMfXMFomersC/buBabhjz+iAe+VLRtIc6VxoRmBMOOiM/hsYI9SOWwOisCXwAG4778mXwrakdJNJCdrfWYczBxlJ/NBX1ea6iNr6xgprP7L9wjQ8s3VwkWuMukRxAq2yHebuFm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779158328; c=relaxed/simple;
	bh=odhb/pL4+OEyptXdZCB0xOFlff++opOt4haF353oLTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GU24hqzzGW5lvqBVkmJLdN8Bz8dhnJFBWh8VV6Fim0C2sgY8tirap6rb8qcameWFTpFe6ftk+tyPLhdwvLckjpqedGi9Oc+b+pck99fbnLfyw+3YI1BkdMPp21wOEQh3vEJ+xgwUPEu13BDalgpzhQ62N1mFlkWhrnb2PnnUJBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ny5VERZm; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-369742178f8so1690575a91.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 19:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779158326; x=1779763126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sk6tV1sPr/bj1s6vxEL5RD26ZR5/PjbXYD2u/WPihaU=;
        b=ny5VERZms5cF3+CaDOLr6xOuRpUcCcB9ek3zj3z4/rwVdO58gpMjOlhah0G7VubUyp
         vHzmz5qH5rHfeqltwh0E8kEpwRvQFVWFrjqy9W0WGWMlzSpQJ+42cxXtsGB7YPIk4Z8c
         txsU0u6tY1f4boSj7xyhDCRNRrSHoyC5uEJXalH190CEtU2bui/xAmNNbGkuKFPHERL1
         j1jepo6HXf/oSrCqDQeC6rYqi9yucVlO47g5wP2BIEuOnaAuSMUSP4uB5uXsvIJbBb1e
         yP0nKVQp3P7S6Ffj2YN8zpeeYGSr8g1sX11qRLQ8RJ+RPjCPTKgGMgdD0S55xAt2tAXN
         jksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779158326; x=1779763126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sk6tV1sPr/bj1s6vxEL5RD26ZR5/PjbXYD2u/WPihaU=;
        b=esyWJZHpbmn3RLlgS2wvyA5evqwiFg6TTHHCQl90dq40fsYLu4/0BfS1jCsDcLBM5I
         vo2JxKR+tuPZXNq9B6COnPojUl8G6gkRPss7xGnLipx9JhVZv5XI0QGSJYCVwtqGDlQj
         xhdCt5FwzEyc1mELWnYIFL2D1vmiw1ZEJsoet6d+ue2iwe+KfCRaIk1vg1XOraf8dtBT
         4eBcQVsnl62jr4IECFtR+wHKzu65sYi2xBivs8o+CQMoVctjoIvoBcAF1ckcFpoLo5pz
         V2aPSK4IcwNCjU3GF2A9aHsP5e/42HvQjX5y1Me49C0BtnXxUQN793GWLKw6NgjXbfrK
         xnDg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ezu9WcjTSP5sQ0fGljytBzKFmqYBb3lDLV4VTcNvWN4T+W3yKnpVIk+gePdOEMTTfCkJAzC2Ydg9HXBCNj1cMGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu/8+sNViiikVMuAkHpG7ZCQki8cg2c/fWp9QAOfuc/1TDpE33
	o7FXvRPK0AH1Wj/f9Xe/hFu+ruvx/+SwN2bFpqo/+j0wCvSp7i8nk+tu
X-Gm-Gg: Acq92OEArlnLg3xaUz7ZJbkXvjiNdm4KEoqIqCISVa7bthHj+wO8qWhUfuTNJGMULjc
	N+QPYMaC8LYvtg/8I4bMANqH27KN6MSNOyreqWU0H2LY4WrVzbW/PCmiG/JwguKqpkYGUfOFf9e
	ypdSct6e9sbVrZ7DdBL9P8O7yEyK3Acq4LoOGH5KypWbrSpHcaxr+NJkByI7vULPxNlbO/oTk2j
	tP+F/9U++HTiCQj7va+V4+9aUytrUDtaZc/7vzlyDtn01FQPBNkRbS5Pb7YHawmVm9uH0HYB2HE
	5sdQXCZrhq0l4lxUM5aE2k43f2H6f45OzxZANMJpU3yxM/+OtWxjR4biSh9yUgA9OhJjpOna9Za
	Z1KAY0tkyyUmUVyDaSwpykJAJpnko8On27IpHepwMG/8xQjoMPTwtJlOPLzub5wnQA+BaBnLdrv
	5fLcf/B8g+nQSLpQZz61slYtLangC6djrHRNxlJNCoMtJvC/nXabn33fJJOqlCToVB0I+ZuRAoj
	TcMavsvE9sDOQ==
X-Received: by 2002:a17:90a:e710:b0:369:ee20:f5e5 with SMTP id 98e67ed59e1d1-369ee20fe62mr3060296a91.2.1779158326394;
        Mon, 18 May 2026 19:38:46 -0700 (PDT)
Received: from open.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695124601asm12407713a91.2.2026.05.18.19.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 19:38:45 -0700 (PDT)
From: Neil Cheng <neilcheng0417@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Neil Cheng <neilcheng0417@gmail.com>
Subject: [PATCH v2 0/2] Add Meta Rainiera6 BMC support
Date: Tue, 19 May 2026 10:38:36 +0800
Message-Id: <cover.1779157117.git.neilcheng0417@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779088499.git.neilcheng0417@gmail.com>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32776-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,jms.id.au,codeconstruct.com.au,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilcheng0417@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 534D6576781
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial device tree support for the Meta Rainiera6 platform.

Changes in v2:

- reorder adc0/adc1 properties
- add Acked-by from Conor Dooley

This series adds:
- Meta Rainiera6 compatible entry
- Rainiera6 BMC DTS

The DTS has been validated with:
- make dtbs
- make dt_binding_check
- make CHECK_DTBS=y

Neil Cheng (2):
  dt-bindings: arm: aspeed: Add Meta Rainiera6 board
  ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-rainiera6.dts  | 1012 +++++++++++++++++
 3 files changed, 1014 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts

-- 
2.25.1


