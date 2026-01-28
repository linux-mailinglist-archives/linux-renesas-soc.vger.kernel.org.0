Return-Path: <linux-renesas-soc+bounces-27511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBawIMf0eWn71AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:36:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5145DA08AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A566305D204
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 11:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0ED734EF0C;
	Wed, 28 Jan 2026 11:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LU4q/swx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9762FE56A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599842; cv=none; b=nwANT3Kap22yvbhNQDVzz+ciPv+mExcONPfuWKZSOlsR5Nkugolfp7+lkzAk8g3BGFc66cdvCk8KUeoxiyh6Or9/DW/BulPD13t+xfxw9pgsCGFp29T72SvwTqUXrIG146dgSmFH8aw8laTJ/4FJAz2litguQqUl19Pj7mqVZ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599842; c=relaxed/simple;
	bh=byVW65zPltQ7vedzB43Li2CtZrKc+x6FuEaSKJSESOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XSghjqz9ksjDHANqza6/zM/ImfRO5A2OCLAx98zqcqqL/vYqC2ML2U4qQJ2pydjKb7+PEDC1AlQvmh22RE1B4fnPy/5YjSWUO0RHz1/nF7cpoEJdw3ON1CxgVx5bIMQHiw4YsyTRcxL/q2IsT5jtac2cnEDybGS3V6wUerPp2TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LU4q/swx; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b884ad1026cso1094292166b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 03:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599838; x=1770204638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1Qm6tXnDfkhnc+vPFBLjvwAKO1y0Lkh4JNke/KQIEE=;
        b=LU4q/swxw/AgQIFzaZ/op+ANouAAlq8bT4y/dn1xL5QNSPDX1k1w1EweqLoOpvfPem
         xBspzj5LSJL8smuzb8nU1DnwJ0mNgb02sFRqZmocwcdBpJ/kkb5/UNknVZOn5RADI6Vj
         lqc+3DpjgA7cu7cklKdAo25SX9I/zFiT1fOzxCF4BrEkYhJzdHd+kIF2Yz6Qzu9lUa+C
         mHhWuE6vJTqaYLrarhC+P014S8Bg0Gkvts5qdum7Wvbwr8hoi6dGHEZZNkBvUANm1hel
         HH1eJrXeK+uIfPinktL0bs05jae2C6NX7zAeN/d8smoxNeL10SCwD8P7BM1mTGn7FdPx
         elpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599838; x=1770204638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u1Qm6tXnDfkhnc+vPFBLjvwAKO1y0Lkh4JNke/KQIEE=;
        b=KMe4nIX9mKNAbrdb+mZSg0tU447uY6GxvgWVdJx/cKE7dJlcSQPSrYkYQFt9GCS9IM
         ZegIl+s/JNMcwCkFYE5KuakNvGrCfpKPF1ebOUEQrphV/PCWQ9muCCovPm+bUv1jDDh9
         TqX8YDc5GKUa6Cye8pGVX6lIY1L5/56OrZyrD/uiVvOrkIC601ytMttA99jdkEJiDfVW
         7rv+hM8IBBEYaQh92id21YcUzjwhq+/loIAhgqUOzx9YYvbJV/HZwCxHNUxOhqzUm0Ol
         kjWStX8GIsggaGqJyMwgsLzaJgKT8PVFtqet6O1OemklWrNRZnwAlymy/i1xIUuuPXuL
         sSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkSurnyR6u0r0Uw7juKNPIACRv404vRj4QzttqR/5zbceZcORHW4NAuP4SmC2b1sR7ofCfUXeArdWBP7WJKXlx/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZVz1ocN7suklPrGndPysCbyRJVa/aSG6qpe2nuH0WJDWff6El
	8fC7GtrDxZnTTDmFWoUaFy9vouT5Y/gQ/pBsSKAnuMde0wJsl2mYkgmp
X-Gm-Gg: AZuq6aJJ/HBYAkzPVpHGjl47NnkTcmxtIaYCLYhvEQrXusLb2dVIYFuEEOlMlTBgfY7
	DgFuCb5b1NGA4zfMPAaaWh1Ouy1KNwZDnBxf9erE55hWTF1b2VuyLPKC1aJVyX28NMfYGbted35
	VRmRYxsHyukwEsW35tAColZW+R0u0aL796XswtUiyWZ6ktXK+Wnz2r7/ogG9ru4bhye/wuCa+AJ
	tGOY3WFtu5PERhv9CsG6wScrd4PAzB44242i7cVp7kXIVyWADJp3CRkFAX0Cl17L6ZdrIB6cFl2
	dXBka9Ik7vKxzhtJn9AQQtDe/UxIVdlGLDzD6INqI+SUINQBKaU0onlrwPrx8gfL5GobMHNFeZm
	SHutvriOuXGRpYkJV4aiZ4W3IR8lRsjsB6AvBpp5PenG4udOZRgansO/P8R7shLOiVJqBm/A21Q
	m9Y690zg+FymGdHaBx1gAsWanq9l9son25ehs=
X-Received: by 2002:a17:907:9495:b0:b8a:f225:ede8 with SMTP id a640c23a62f3a-b8dab2fe310mr355691966b.41.1769599837383;
        Wed, 28 Jan 2026 03:30:37 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm114400366b.46.2026.01.28.03.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:30:37 -0800 (PST)
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
	Biju Das <biju.das.au@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 01/10] dt-bindings: dma: rz-dmac: Document RZ/G3L SoC
Date: Wed, 28 Jan 2026 11:30:20 +0000
Message-ID: <20260128113032.337231-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
References: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27511-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,renesas.com,microchip.com];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5145DA08AD
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the Renesas RZ/G3L DMAC block. This is identical to the one found
on the RZ/G3S SoC.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tags.
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


