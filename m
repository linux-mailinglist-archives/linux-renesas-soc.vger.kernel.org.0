Return-Path: <linux-renesas-soc+bounces-28769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMh/CEw4qGkTqgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 14:49:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 686B1200AF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 14:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84AC03022564
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 13:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6A23A254B;
	Wed,  4 Mar 2026 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB0FOAvQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3942848A0
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 13:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632132; cv=none; b=XOYNlc02+ij+9Qpl8iftq4yH/zko4RfNeYTjT9u8kBe1ul+z0M0vfa3++bIkIvRBraVbOe3Cp6cZJNlssHmNyLteclZ0HqowGxgF14DczKeOlytfZAsENBMUyRcvbdOU4cJNedjN5231UOLVO9Rwdc1VixyUoCs3SzqH8R80XnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632132; c=relaxed/simple;
	bh=6OEGsU2MLt4JMocYh++a3wWmyrukETDkXbHMmWSVQ+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4vwNYmblhjz9JZlTl7qRaatlsjg1QgQ7EO9OE0l2ppYY8Ait08t4H9eL0dRLf8M7st+JWMh6eRhF3jT6jkfLznlrwtusLNCRksQ5r+NUqW3/fQSCoe07VmnDMHVRdlb4XhISPxUccVXvVhAjiv5gtMoUG3bLYuTgsruicO+srk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB0FOAvQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso3921045f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 05:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772632128; x=1773236928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7FCkxbz0uuB2WpYGMfhNmyuLtfIktURdr7cmvLKcyY=;
        b=dB0FOAvQ0/9xrX1x4w4t927xlRjAkfOCoUdlE4SudgSPpU5AQRjTuCONNpBKH4y8Ye
         wQIzbHpfcMPOzH5iyRQGcWFuadkpqHpTvQxGw6Z8Wj+R3aS3r5dFYcvZi7bFk8h0zaSy
         TyVmhYKXOIOHNw/lis5gkGV2CZ4xQw5iwUExNSiPttt+cyXnO+P4yi2V0ka87GYXauEW
         +ls1ybOTLyHv/AbNncuFLG/sgm00wCyoGCUsxdENV/U2m7TwUbT5SfsyFoolG3Cr9TJl
         /QL6l0nl6CJYIaWvi/XHG/v9iWku/iUhQpxPZhP2kbDHdelSEbtxwNSpfhcoyZZ7VyQp
         migA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772632128; x=1773236928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h7FCkxbz0uuB2WpYGMfhNmyuLtfIktURdr7cmvLKcyY=;
        b=pAdm6zT9M7AKmF8tqRo16mcagTNDnK6HUEwqAd8JlpNs43GL7dy3rBVJcLdI0SiN40
         bsaCC3OfTBxGZoMnFWEI1SVbpqcMkW41h/PYSrgAWesjgjrruzKj0aMgxA8jNNJmuJF6
         Xzcia3pD3RabvA1YgQ5SqIq7jul9jJWzgFsuJVwov0/1PRN3CJZTpU+M8ude478aHzbT
         uyiL6zFW8Hr85nQQevhIOK8aQ/mYqyU9TLTqnd4jISe9K25uIP2bcolI6UgwmTuUTF1k
         z7kaq9IOLmMxK3CM3ujxK2dLzxosHJpBjYWWFbgpoanTz19EUuY/vqo/GcyQXr7GVzAj
         idrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNiSyrUCwROZW6H8Lw9HnshV1St37p/a9JFezNiMpYAhCnctYJXYUtAdQ2UdxXUjbFhvNnnAhNNHktZhyq43J9Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA0Yc+4qg6kPZ6vr2hB48SwJC/DZqkUphLOjoQMRh7Is+HqYMg
	xxoCQYZh3YSBit6HZmY3yjEH81sHD2HEyNo0yEEZ1AtevnuoG2mQwPUT
X-Gm-Gg: ATEYQzw9BxovP+VAsVQPWyMlnYc7WHNDyJgwFmzpUd8swfJ0Wi7fwnXtiY8sbGwlRe8
	uoujQiJTLCp5/xd90/yGXRVZNNcrjw8QGRFHAQfAzDzbIPfo4oa5LkzsAG7ef4KG71tv4mk/NLx
	41hdB6hDLuSug2kiiZjCMwAXHDxRPXrFtw+HQFCgPXdULn0NdPIo3S/lcx5j4W9W2wl8td690z+
	zHVNS+aKU50wGUC9IFMQZFlMzuI1Ys7Bupht9+QfvA2RhLPgtF2//ZiOlHjbZkA26IAIkqCp0xZ
	tq0ffC+aoymMzYqpIUXKbBeC+5jFj9QSTEPQeD51McX017Us72ljvlCra7jMkmiR3BIR9wbQyQZ
	TRW6Thf4RSuEQ6ToTOEmDl2jr2LLRruvhRHzUsgivdgyuhVv5r4xk8GW6e+cCdYmGNfpvULGsOq
	h3xvDnQAidyMrihSkFkQ9SN0TiTGYV97ArJuTf+KRJXA==
X-Received: by 2002:a05:6000:430e:b0:439:be82:1fd9 with SMTP id ffacd0b85a97d-439c7f99994mr3850514f8f.12.1772632128092;
        Wed, 04 Mar 2026 05:48:48 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c65e0b23sm7105229f8f.32.2026.03.04.05.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:48:47 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/4] dt-bindings: gpu: mali-bifrost: Add compatible for RZ/G3L SoC
Date: Wed,  4 Mar 2026 13:48:36 +0000
Message-ID: <20260304134845.267030-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 686B1200AF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28769-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a compatible string for the Renesas RZ/G3L SoC variants that include a
Mali-G31 GPU. These variants share the same restrictions on interrupts,
clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
validation accordingly.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index db49b8ff8c74..9db9f84ad964 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -26,6 +26,7 @@ properties:
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a08g046-mali
               - renesas,r9a09g047-mali
               - renesas,r9a09g056-mali
               - renesas,r9a09g057-mali
@@ -150,6 +151,7 @@ allOf:
             enum:
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a08g046-mali
               - renesas,r9a09g047-mali
               - renesas,r9a09g056-mali
               - renesas,r9a09g057-mali
-- 
2.43.0


