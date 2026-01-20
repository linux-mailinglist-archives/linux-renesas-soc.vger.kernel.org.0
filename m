Return-Path: <linux-renesas-soc+bounces-27105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKboJSRkcGkVXwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 06:29:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FDA5184F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 06:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2394F806A67
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 12:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2A042EEDB;
	Tue, 20 Jan 2026 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZJENXM3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943FC429839
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 12:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913561; cv=none; b=HWB2T1mz3utLh4z82J/UQcxOjFd1ACo56UertShAXmHQ6p8IBcLmIqsEsw7mv8Y/FEBOQzR+Ex66bud96202J9POY9QZS4CBsR9RakPbmfuVlFSSas9hzxOzrGdMGrfz1MmDZp+MXjdGQ7ph53Gu61QEDixmzHwyF8MZgcnLEec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913561; c=relaxed/simple;
	bh=VFvvzCPVMppU9YZe/NAS6ZVyOvp/Aoa+1BRn4/TUYGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lj6X+MKzbGbYBLbS/WcbcQg3q9+BFyEPy6Xp/AmNIGnHrI+p7XWn2FR0MuahybISJDBZwDFFKeCs1avrmbzx7HbW1cHQOgUjh3OA4kdBMHd00jtshpHxnQTR2ADtbry5h4LDprNkXKMITTofkdZ5YQqjpmyJbEvaXixsST94BzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZJENXM3; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-64bea6c5819so8765993a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 04:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913557; x=1769518357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eN8iJ2c4mGSzLhHXbqnnydUI7yMc6vZwoegrLK0Ce8U=;
        b=DZJENXM32XvUP+cXKxMScacTdq0w3VJnAPQGJVqr0gEiMZ9UXAtqy6PNbatrx3xAAg
         aj7ou7CmkmCAmtftrDGgrPuV7KREPCTsvxEddaYY+TnaFZcr08xqgHejH7Bbu0/C5zpY
         eUoeebGi29sS/vGJ3ZKNlfgp9r4Jv0ugX/v1AexX1uRMB/fHnFeqr4zMLKhJC6yjiF39
         UhLSjE/5aejcvP/iGoPKZ+05n8y3U5VGnXid7ruXr5LF4SY2GvhtLP26kg+8FdBcmru6
         /AY7ADAECHv2HlMMpOMOBikqLgH42t4oUrK+z+Ecx4gjIgrB6JiDbeVHiOfjmHMcowhs
         lysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913557; x=1769518357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eN8iJ2c4mGSzLhHXbqnnydUI7yMc6vZwoegrLK0Ce8U=;
        b=KlO52dZbeD3Dr9iggFAMl38I0V5ZV6GzYeHUm0T25q0PVoT2Z3zWu/QLF1k3acRUg8
         ah0Z5qisSUvv0tpgphvdh1L0LEoKglziiU/wltQMq9JcjNCvOaum8kwcLcsWQPewRhAS
         0mMT4WvRkyiQKkaH3zb6LJaCSxaD9/6N0SEg459klVt9OCBSB8RKBSYW0TK61wM38QDW
         0wd+efYtOcaJb8Cz/qPpcL8I0dSMp7fISJ2PnwwoEa0Vw1DCyGhg37h6KWTbvw14tWor
         MN8TvZfxI/gsaSBdXCLBJ3PP0aOWUh9GVaNIHQax62RLpFMBDEuYYQlndjpOX4cxKqrV
         VXaw==
X-Forwarded-Encrypted: i=1; AJvYcCWKtzEU9mGVS4gzNMs+v9xz8mLRM30OALBE9IZbwcluYx6+wdnCyqtx6zuMQeC0ReFtgy+wFrqpX9tcSksDjFDkgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHYXunJMEz3GVDfHw4IRNGjrUvcSzejzoE7ngKaqu/bAWDDdkr
	9UvFo85yXAlwMnE3R9ndozEDShFxmJdMeghACZgQp2iVg1SXgARQJ6nx
X-Gm-Gg: AY/fxX7REn8fq/bLmdQnZhkggkNcP8asGafafFZQYsQs1vfLNYIVNKkPxI6ObXB2g90
	ZGhvNaj+1rXT+96tyU255iuW2wRQX659HMFP5yuDqaXPtkf+b4u26JRHB+mn0iM8btrWfgylGzH
	qNp1d7oy0a1eo9whPrNhOQu4D3WHJAFZt1KwaEOmzcWFy+FcVb50wxozv2i89m9RsU1KWtnpYlJ
	RhlgC70d+2Jxr61W1HOpvfikd08faOgOvktd6C95ZXz0C1UJsrR2uifXtWYiKtfc7EkHQdXXyhd
	BNd+9zCdzJC3QkNa1ZeEJEERnKKrnxUBmoq0Jp9/4Mxl+kgYMZ05O0IV1oSZ2HgvuFtQ27XDo3A
	2BA3LjJOkjx0DIenawrS7Bi7/rR2/q1yLCKf1M6GLqAUUpPmCNwIoUhE4gTCRmaeg4vjqAVLfWW
	SBnjIj1LP6sXtlvbOi1YaHssgldWsHYuTkhWI=
X-Received: by 2002:a17:907:e114:b0:b87:be08:815b with SMTP id a640c23a62f3a-b87be08844bmr596030166b.27.1768913556604;
        Tue, 20 Jan 2026 04:52:36 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c8c7:2ef6:8ac5:5556])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959ca32esm1420626066b.41.2026.01.20.04.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:52:36 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 02/12] dt-bindings: dma: rz-dmac: Document RZ/G3L SoC
Date: Tue, 20 Jan 2026 12:52:13 +0000
Message-ID: <20260120125232.349708-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-27105-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 08FDA5184F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the Renesas RZ/G3L DMAC block. This is identical to the one found
on the RZ/G3S SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
index d137b9cbaee9..e3311029eb2f 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
@@ -19,6 +19,7 @@ properties:
               - renesas,r9a07g044-dmac # RZ/G2{L,LC}
               - renesas,r9a07g054-dmac # RZ/V2L
               - renesas,r9a08g045-dmac # RZ/G3S
+              - renesas,r9a08g046-dmac # RZ/G3L
           - const: renesas,rz-dmac
 
       - items:
-- 
2.43.0


