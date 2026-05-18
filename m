Return-Path: <linux-renesas-soc+bounces-32751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCRKCaTLCmqf8AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 10:19:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F30568934
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 10:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8B033058E63
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 08:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5553D3E0724;
	Mon, 18 May 2026 08:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igHGEYKo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211FE3E00BF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 08:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092028; cv=none; b=qR6E8myPSQCE9a/QgvccnGgWkdv8bBca8xCRsdDzU5rFqUh5/m7rA3o5fpW59vFkPS7IRY7NaWxbV1BgOzKFJh1grZVYhqFKjCGaOYfaloUAYftAgA731nAdOcQBUj0s1U8/F6DO8HJXzTZUIA/kLsmN6nBrOEtXVxcUmRYZ0pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092028; c=relaxed/simple;
	bh=S7dWrYvFIldw2l1SOFgEAr+X6zlqSVikajVanVBoRe8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=omEusWn7tfyM+JQ9OSTj2L4xpfzHu58/BCg4zTf4axHrzeQXkoHBtClXiquJWIzBX+EC3Db3O1807nvlCQMhicALibjAg5rmwABLveHeySo7o7fNqNzYyNKahlncU3GXVbTXYWKRx5QZNRFY9c6gEo5mAWLW8N3XJK6GaqgwY2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igHGEYKo; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c80227c9572so770180a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 01:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779092026; x=1779696826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HR4Kjt+Vrl/yVgY170pfdcB9p9LiTbCCTUEcbYkBEOU=;
        b=igHGEYKoGi6HdgS51ao02NAnH2yw7sdBTfcdT3DVLnOuwXXufrUssMyhdMTsD5pLMU
         C5YsIdFgbWqkakzYurh/AXnj0bOVBKry/6XhNAYHX+VaNrBlatMUqxXBtGP4n0l0qxM/
         w0Wxh/+32SB20Bol6OSVfZucwJ8n5KXOzEXgU8OrGyacaQAZVbGXIej/iihYD/K7EYEG
         Tp43bsHtCEOXX3415tCDjvrXDZWpGPip15BWoEHDjcl/IbCQGVvv9XEf8WJ5DdFB35T6
         aqZwRvzzQ6E6o3y4TH92TAqvzLRqkqS+GKThW48fAqbLl8e5b2Ha2EZDbVS/hFp+R4IU
         w1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092026; x=1779696826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HR4Kjt+Vrl/yVgY170pfdcB9p9LiTbCCTUEcbYkBEOU=;
        b=tPYsUndTP4g/5gkOMiQCQ4PbSZEP7tX6xbpIzl/X9Jf5Kf8iEDy1qwFRoyVwL4HQqy
         IX8I0vCf/2SVmZhj/R2PXrDm8zLyeW0lGgJHx4LFrPL6FnhyaCwOOU6YjEfAu1yhsXiT
         AG4Yc0Gtr8jOzbnk7z8lEBtWzZg9HKDTHmAG1mvk3nB7FMlZdo9KHIQ5bFZ6pOVHQALL
         qa2KhGxSyxt9E4pBsgPcXuG9NrpZRQoko5ShdFFBBqXINoUpRgfbZFjzGjkqh3ygBZGn
         o7pl4c3cb1dlVzhnbLUi7UFe08xsm071NZT5LVrcJWAaoPFZDQrYItL5fc5S/+x5ft+V
         qcfg==
X-Forwarded-Encrypted: i=1; AFNElJ+VYIrLiGTjmPq0Nfx2SCPIx9HrrjT8Dd3boAC8ezhjXfXila4AkptYPZzVe0O5u0lkrz0cCOCWfv7ijKnjw3d/QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygh95CXxW3LrG/j3UzEjvSrBZPAJZAyBy+3acv36yqo0kNWNsA
	r5JtIrUnt6Ey4TQm/D9TcGK+wvmoEfzt1BYRdKNUgdJ4iSen8HyHlTti
X-Gm-Gg: Acq92OGFX5rD87KF+Pg+KYMhJ3skhOzX4asy/ATaDCZJH1+dsxfnfslCymLo6ATlASD
	7wf5n8gQjZS5IgC3T+m9rIoqzeVOW7jod70tSBev6PAQNmTQGidLN6j6OsKSP7Xdi1kxbwu8gem
	21iVW5djzuC3ibpSx9DXFuztWWF0FU7GXrk70epWqPkDqFSuHRyC9EVg6YW/WJwwDHxifA4U5Vm
	UyBLK7O2Eqv3NimaheqPtx2FjwD86+FzOSsiU+OvQgLHF9duS+0kEA4BcJ2HdZfDrPc86qPbG2h
	2Cm7v5y9r0ewO5ORgtRtzNwsaZlf0alUm6M8TKFLKzHNe4CJY71aYAywVVEOR+SIWm2blyArHkc
	MPY5fV3H+SgJ2mvd7N5UvC+irVfnKRqvNgJC3TZVMISXTmLWIVneC+bH7kZCDt4+vwZrVFccAXZ
	PoUd7LW8itqxKBjNm8+yTaZjq/REScW4Z+knWQVDWj77EBYFuIz/B8LEFpJkENUG5PPTFaVdxjO
	yMq3YwbXxd5Og==
X-Received: by 2002:a05:6a20:7d9d:b0:3a3:2b7e:a4ab with SMTP id adf61e73a8af0-3b22ec60b53mr15472490637.44.1779092026391;
        Mon, 18 May 2026 01:13:46 -0700 (PDT)
Received: from open.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb100706sm12749462a12.17.2026.05.18.01.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:13:45 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: Add Meta Rainiera6 board
Date: Mon, 18 May 2026 16:13:24 +0800
Message-Id: <4f7aee0a2dfc44770347ccc82e54820e7b35317c.1779088499.git.neilcheng0417@gmail.com>
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
X-Rspamd-Queue-Id: C9F30568934
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-32751-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,jms.id.au,codeconstruct.com.au,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilcheng0417@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Document the new compatibles used on Meta Rainiera6.

Signed-off-by: Neil Cheng <neilcheng0417@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 8ec7a3e74a21..1a2252eb08f1 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -95,6 +95,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,rainiera6-bmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
-- 
2.25.1


