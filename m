Return-Path: <linux-renesas-soc+bounces-18937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6180BAEE81E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 22:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B87943E017D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 20:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91C125B2E1;
	Mon, 30 Jun 2025 20:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgleltUZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C91622D9E3;
	Mon, 30 Jun 2025 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751315012; cv=none; b=F0++18IBLkWwzLmrG8fslrEy9ITA3s+u1wb7IKvgMATTT5a4qvOhxNGr99UJ1In/tNt88oYyLnF2tCsAbcPqk/0Urn+vC+7yvnScLunfxQOsAmvcD4UW3tFM8I+F9ipVoLOfbJZDFOXhQ5HF7534x+RAEQcAKJNrt0rREDgtaB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751315012; c=relaxed/simple;
	bh=q1k2ya7ntd+84OBNE4fCXhUPBLrExVHnmfq512xeKB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aI5UagVHhZFJLtVThV3cNuYKT9dX6LlSIrnnaKZ8hGcvTpgOL2uopRJlWqGa8lvClGLLMhMN0dlA25Oskk1K2AN1+8fVMqV1iCiDlMOeoN8cEMStySK+2IAa3THBSqlSczy8CErj2888MGFBjvaC36qcuA3WSXBBYq0BgSUJGUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgleltUZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45363645a8eso34186615e9.1;
        Mon, 30 Jun 2025 13:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751315009; x=1751919809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRRkV+fcxIvFVti07imS12JhpI7oaLjvmCHQCmufjlc=;
        b=WgleltUZWFxpDtQu+IAyinuUluTXKN5AH1cRGO4U6vOP8AR0aBtbiWqFOCZekuFu8K
         fK/7Yq7xTi88fONS6CJZLwWXB1l2XaN2XQPqAgWxSj7Fi/iR5WK1BOlGUicBq9flMzDz
         ne+5m2OLBKuPMk40qqeynFf6vqysibqvM86mMOEK5byImY6FVzVqXT21qgvyOZ9oy0We
         B0dGcmrnW3nVuh21nIbUEec7eTJVj39QfgQBh+Uou+W2Xl1T00QexzhCVcKWRwrVEVMu
         8PkGvZ2lAqkWI2aaWlc2m96IOucQzLikc6CSyYp3gc3GRvAqtbba9Ka7Eluf1IV/ed1E
         P/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751315009; x=1751919809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRRkV+fcxIvFVti07imS12JhpI7oaLjvmCHQCmufjlc=;
        b=ZkOXi0704Khp0Tg4eJFD1gaTMv5djbe+rALkTyp2Gi1psRygN/pUTD6YiLQVSyxtdd
         qeX/2ZxW+NI5NLvzMPrVz6ayGY3P8SCoICr9t8Knb+D3b1vQ1WK2Dp5zeTrAW4fCpZWX
         70W4uHBdTQ19u5vNHi4F4hAkD6GvJfEY5qEnAOHawv2yKcNSQ3tOQThnIGrcJBSPzWdL
         4OUywQAksJ9CRX9lVk3DGYGmqBUH5O+PR8G2aD++xfnugeMNb3FdyemWqijsYzlfG+97
         /UjeH3NQKx0o5NWw2zZH4Sb4Xhkt5ol7P9Z99GEhm7VB7f4BRKcGwOW5w6B2Azsu3r8I
         r7nQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+FIDXWrEZw8ZrF0ZkZcsy9fudEkrpdBxKDodgnLV/wAYWb3eeY/gXsw5eULrXOqYN3uENdtlPXD7YYtNM@vger.kernel.org, AJvYcCUsMS1iexrMaZsqbMNqQ7JKpynfBa7deifJTa+RZPweRtp/kTYd8fFbUnn/heCfZnqU9DY5SS9sE033TjoCAOLkM84=@vger.kernel.org, AJvYcCViO4tjVXikRk4Quv1KTVk7LCAYfxvNu6c1EyVVX9aKCM61KjASwefI/KSNGp9dpW+YfABTkYbdJQlj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3nVkWcb9hDgKRpg0b9iUmMO1AtO9tCQtiV2YflNP3bBDns47J
	yD4phKXtUj8KWBOiBgggh2iegKdxUnAv1isxQ5W5uF+MxlP3gj+x8298
X-Gm-Gg: ASbGnctNRBLJZzmdeOE4rHuIUguFT8otLEH/HDqeMvRdIpgMzXMeBMwC9sbUIKWb8Ue
	Zl+YccHSwhWVb/pzWN9/lSw2VXu5Xl9VEQM2zzvw3RcSwzSlnLBB4NOdMd4ydPtXapw7AjIUfhc
	QsZSAXt4tvPh/feVMtin+bc/C+XhfOmY0cB7FT5ASkwO0tcnWtqXFgth7mvRzEMLagZwsMo4VZN
	f//SaKz0r8oXOzx22KHoJPzhyYmUUZdQeDmCXSnt0hGX6yQ0G1H9j8EYKiXvi1e2/vZxrWdqGyn
	Kx8WKKtCbfdepzvdNKtg3wkTnrwvUooZQTbaeSdDCbe1F1mR+Yqgl0GUJJtBPzH2LaNYdB4KAu4
	lFfkZnSBy/bk=
X-Google-Smtp-Source: AGHT+IFrXJra6NuB7SL0le7cHxAKMCh3buaoVInV13ZQw3kBeIKxu9AD0KJpOVAfTvhgnImo7oUCJg==
X-Received: by 2002:a05:600c:828f:b0:450:d00d:588b with SMTP id 5b1f17b1804b1-45392bc88damr135090365e9.9.1751315008308;
        Mon, 30 Jun 2025 13:23:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a065:f77f:7ac4:1c25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5b7fsm148523195e9.10.2025.06.30.13.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 13:23:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v14 2/5] dt-bindings: serial: rsci: Update maintainer entry
Date: Mon, 30 Jun 2025 21:23:20 +0100
Message-ID: <20250630202323.279809-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630202323.279809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250630202323.279809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add myself as the maintainer for the Renesas RSCI device tree binding,
as Thierry Bultel no longer works for Renesas.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v13->v14:
- No changes.

v12->v13:
- Rebased on latest linux-next.
- Added Reviewed-by and Acked-by tags.
---
 Documentation/devicetree/bindings/serial/renesas,rsci.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index f20de85d5304..f50d8e02f476 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -8,7 +8,7 @@ title: Renesas RSCI Serial Communication Interface
 
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
-  - Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
 allOf:
   - $ref: serial.yaml#
-- 
2.49.0


