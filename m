Return-Path: <linux-renesas-soc+bounces-27108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAU8GVdmcGkVXwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 06:38:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6945199F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 06:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1FBE96A7ECB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 12:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C69436360;
	Tue, 20 Jan 2026 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjC5Rwm9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDC842EEC8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 12:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913563; cv=none; b=BGRyY7yOdk/iup1p1pdWs8pzSaCzAVnNYPNrRN4by+Iw7j5ZShMEdpipsIsZJH7LO5Znk3OUOFfVynkjT3Em2j5cd9kLlv1i3kuHRPPW/ahEwJY04233pTB5vYopFNIWrT6hYO6SOHh9q4ql3+yUp9+IulG9ZT5PuQoljsp5Tjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913563; c=relaxed/simple;
	bh=XZ2bJVtApcunkQJ+ZcmoYT6hY8nmcZSiai50sivYXco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UnOIAYtZRqd99ugJYSfnJcM10E5HZuw0tOqaLAFtHL/t/6ooyEQvgoExS75LBKgSSb2IQaGi8rwlqMjrQ4LR1JmpJ7tP40yoH7tdgEcqu8vkFoLmU0CLCPtVwgqK/5i0eC7KZw62p4g0orUA4srD4WN6TWkWkkQCDFmKcX4yhbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjC5Rwm9; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso731653066b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 04:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913558; x=1769518358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVwkPEr3F26ihv8o6A6abL1apqiuDiV/AwZGXoykHlA=;
        b=gjC5Rwm90ttyyiFQ5K4K+L9GTZ7G3O5UaYDDOVMKyabwEpHe4nEB+4fCLSUJdDz4gV
         aQLXIjr023G0Anj3qP4GpBmKBVZ49YcM39vGURiQaeMw8jufCUPPLlBL2d5K3XkHJ1QB
         C1T55YX3nlcfhpXXmyyFnm+6GnTxz+pallkYulWu5FelzaM0tbOJwZNoxgkzFifpB472
         XF0q496t1K78nVu3LkukijINB4uAwBUwb3Ov6dM+3M10DxrB0o6KFRWTDZrOkr1K7tCS
         im+DKtcizdk+p3C23UO5u9ZLJGiPr6grPn/eN8v6SWDBmNajm0kdK1IKLBx+ssvf5RxD
         C2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913558; x=1769518358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hVwkPEr3F26ihv8o6A6abL1apqiuDiV/AwZGXoykHlA=;
        b=G7GJsaqKsmdFvD/9BH7fftnDjkPfweITvEoT1DwD8LxW6XzSug4O+aLoeoKVzvMwzf
         ZNqy3Z+byu1iQlx/W9cf2FUf0EEkhNGIeGmH9uk3xqD4mA2WsD9wezYL1DEekSBQfsF8
         H9udnouNAu8MbCaVlwEJBRVH5dmSJesvYk5pIWqvn5ogCr2isnCm5039Z1W4Y/m5tOB/
         4Jl6Y0fBwhyhBgUuv8aFTK7qf416Qd2MrTLW46887m8JgQXINk1jV5VZeO6G93jiO309
         gcO/aZ+r/Psin02E4MqE5MbRBmvjdAVzCa0xI4oCy3Q82A9XpxK5gJqjGwMNGPfWqpvA
         f3nw==
X-Forwarded-Encrypted: i=1; AJvYcCX4UarCIBqkJckOJ1vp+ALt1jK4jihtFEkzGRvaYuE/opAgUnJv3q1orEB0Tn9L5+JON5+MPPzHvPBR7ii+tsU8Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyksa8WfHRNSdYKfktAXWiOePx8qmgFuNfkU/Opr5APeN2zk3Zu
	LIxO8gNhmzUWmKxFdFRqZRw5xm7zqKsZTlqofcI/uxRCiee5T4fZN7fZ
X-Gm-Gg: AZuq6aJc5hpb71jYNLsaMtiyLV6/phdQAOCkJnrK3e5XTa7DX6rWiXdV6XXRAEIhat4
	Qfq0aWzWsAqGMTaPVGNMQgi6thodnjV5YkpSSsQuojDfg3iiO46iM3dEycwOYhxoGmJblL72E0Z
	worMDGB9ja0K9yVMnSlBw0j6URuqCwqFodbMVDPpPquvGOrc+4FXTX2b2L9WiCjpKfyhTs93zod
	rmApImwMmZw4amqYVZYah/Lpyt2FUas+kkf6oeY/osRnSSdA0yF9i51LP6Xj0SpJphdgFR5D39z
	wJHzQYC5CDI+TcXlcJXnvdQqIxCuDUnGig0TLUv9uKCnYkUXSaKeAP3rpYtBGxLNRjiVIHZeor9
	CoLCyWKnbZKDkCuf5I1mIjBdjhEto1bjcx6KpQyxTmPl3nXdd6d4Dfj+y/7+fYTGbQtfnFTm5mt
	Jow+ox8dhFJRR2WVk6XJUsWjt3zWsZly7T3C4=
X-Received: by 2002:a17:906:478f:b0:b84:2023:8fb2 with SMTP id a640c23a62f3a-b87968b6ad2mr1127034566b.5.1768913558253;
        Tue, 20 Jan 2026 04:52:38 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c8c7:2ef6:8ac5:5556])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959ca32esm1420626066b.41.2026.01.20.04.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:52:38 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 05/12] dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC
Date: Tue, 20 Jan 2026 12:52:16 +0000
Message-ID: <20260120125232.349708-6-biju.das.jz@bp.renesas.com>
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
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-27108-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 0C6945199F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Document RZ/G3L (R9A08G046) SYSC bindings. The SYSC block found on the
RZ/G3L SoC is similar to the one found on the RZ/G3S.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
index 4386b2c3fa4d..94ae72eb8fb6 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
@@ -24,6 +24,7 @@ properties:
       - renesas,r9a07g044-sysc # RZ/G2{L,LC}
       - renesas,r9a07g054-sysc # RZ/V2L
       - renesas,r9a08g045-sysc # RZ/G3S
+      - renesas,r9a08g046-sysc # RZ/G3L
 
   reg:
     maxItems: 1
-- 
2.43.0


