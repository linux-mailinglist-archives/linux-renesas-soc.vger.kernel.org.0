Return-Path: <linux-renesas-soc+bounces-25378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 221BAC943E0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 191AE4E55F0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F034530E84A;
	Sat, 29 Nov 2025 16:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNo6IoqK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D002030FC31
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434617; cv=none; b=B3CTKf03gaoYeFeQZHZPorfRFRP+0uXmtKOk9KIh0JILW3Z5ctjxo2G0MArBuBugGy68sVg9YplCkF7rpDDQuPQxnDhZvRyEBz0cAtH0yx1CKen6BToJb6/vahXhH3LaW2dqbUNESE8L2hY2NHB+VaLFGrQx9yKozch2wgTREA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434617; c=relaxed/simple;
	bh=hQcgSPe+3G+uQfj8XLN0eIAy48l320/rWO9G0mm7LGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ahy0aSsYUSSWbzOQ72VLnX94G13ni2KZEL1i94msEgz+HReJRQSjfbm4MiaJmrcKknbR/zY+2qlK/YGqpZ+6io+TOENA9JxpyDsdS7u043N4YgQVSIEyaPevVxme5cRQXxMt/Cv826T4N/3t8LKaWFpkvrzhppFEZ/dIUjcBov4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNo6IoqK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477632b0621so16048155e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434613; x=1765039413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WU+1F9sZHt+KpcH2RieoRsvtMz9fRLo9Sf6niQnCQ5o=;
        b=VNo6IoqKzf0FNLizGybC+Jpprqilvf2wV2mYpZcEY3MqTtWVr0Tumrf97hV9F1JSF2
         5IAeVGpVAQ0l530KLgoobB8JZrGti02CFqbT1Ze5mR/Dsbxez1XndmnKbKS0gYOpyji0
         o5WAzHqoTeGkeXRyJWfP6MLRNCD4k5W662yJi5Z4g+ojqxSLMxVhc8stkoYcTw2ivoNO
         0hq0WcuJZ5SjfuaT1MZrmSfKOMj98uWQzD3enIxbbLS5BLKi+wM+DuisRKif87Lo+XPS
         K001v20U9EGrBLqkL+HJPGRD7BNPoetigLBuj3xGqV8QEa8nJ/gonGyEJDdpoPIMKlKK
         Jvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434613; x=1765039413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WU+1F9sZHt+KpcH2RieoRsvtMz9fRLo9Sf6niQnCQ5o=;
        b=wjy3rrxe4a0xGKLHxw09jf3zJhVy3p9V2viQ5qb7N94sihz8z6zhmeXzAZUA3k9BuD
         DLk0NaYZBddUy2Hfe3/kBTBsvcRokKvPe9wjRL8VdqLjjzEJZk76v6awHgNJJTkWobbA
         xMpjYrX9nWIHsHWy9BKij8HkMY8smO2IhvhfaByw6WWiyfZJ5c55EpQFoTobAFQu8DwS
         6iWqh5Pvot8JozLDjOk1Xo7a24V/ksLgnz//06ayih2pa+xUPLnUujQZpkix8QnACit4
         WioMux/v2S2vN5/LP5rY/66yjRNMDQDxzfKF/if0E8FPo7i5bzjm0W44NNMaj1JxxiFf
         VwNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVovyuKm0wgjbwfbxRbBDnIFEaRN04G0UPAkhfmA4IgmFBx5ApRVcMimWNigICgBYzYjepBWWNYds3OLfDmqT9zdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YweIDSAmTK4ZZDsBeH+Zsj+aWaok7bSv0MsisPWBm/PkFueKqsc
	UZl4nO2o45msI/bRh/OOJpQi8nMhsKwTMpm3/WXaCLabJwlN1os/JE9k
X-Gm-Gg: ASbGncuf7KZx7TyvlY5PDsm06Qj5o9TKTRR4jdzQ/HrvREfFbUlbEHZZ6UgB9Q/+E0V
	LF9VfzPuPWfu3LLStp6hPj6Dvd+j6pIb1/GzK28jYU+nPmaDa31DDRllXU66lf5o/Y5h2BF0kY1
	uLvTS+L5tZpwf7P58dFxFbalYeRg/mnSVZ0TZwaGLRCA6j60BBsCgv/iMJcK2fc2HrnSmy/5JQ4
	5LL1dJctLsgMBhFhJTNaXzQqE1O7ZePEf9i8n963/LKjwb+oAATt9JHnAkLqp/meF7imbaRGQKh
	ejgCvURTqots5CGaS49D3mbMmHxuYJvJEi16Z7n8lEMO9LzCyj7dgAy6QCnBUTfgKND+sTDFZIE
	QjrGLMHSbIV8qcEsGfFaFW4uRGbFVOEapMxp0S9exYF9prSwA4QJC6VLdAFo3XyjW9Yjm6WA92H
	CKsWjZMdTL4VPFgLDXDy7Nc3fUSo7T+VFo8KdhZ49hCM/3ZulwPz43FcYQ37KZn/UFB28tB5vad
	AULqtYWlsTaGZKb0gIUH5Iwlf0=
X-Google-Smtp-Source: AGHT+IG4VSqxVVSZjRwFuCe0LHraq9/dWhrqgN/VtxoabswYV9qfBD5LmWWmAPZWuqMDQGEweg8EGg==
X-Received: by 2002:a05:6000:208a:b0:42b:3bd2:b2f8 with SMTP id ffacd0b85a97d-42cc1d3543dmr33904842f8f.46.1764434612707;
        Sat, 29 Nov 2025 08:43:32 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:32 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 06/17] serial: sh-sci: Drop extra lines
Date: Sat, 29 Nov 2025 16:43:02 +0000
Message-ID: <20251129164325.209213-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Shorten the number lines in sci_init_clocks() by fitting the error
messages within an 100-character length limit.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected tag.
v2->v3:
 * Updated dev_err_probe() in sci_init_clocks() as it fits in 100-column
   limit.
v1->v2:
 * Updated commit message 80-character->100-character.
 * Increased line limit for error messages to 100-column limit.
---
 drivers/tty/serial/sh-sci.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index ff5459c449fb..7ca94fa84a40 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3186,11 +3186,8 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 			return PTR_ERR(clk);
 
 		if (!clk && sci_port->type == SCI_PORT_RSCI &&
-		    (i == SCI_FCK || i == SCI_BRG_INT)) {
-			return dev_err_probe(dev, -ENODEV,
-					     "failed to get %s\n",
-					     name);
-		}
+		    (i == SCI_FCK || i == SCI_BRG_INT))
+			return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
 
 		if (!clk && i == SCI_FCK) {
 			/*
@@ -3200,16 +3197,13 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 			 */
 			clk = devm_clk_get(dev, "peripheral_clk");
 			if (IS_ERR(clk))
-				return dev_err_probe(dev, PTR_ERR(clk),
-						     "failed to get %s\n",
-						     name);
+				return dev_err_probe(dev, PTR_ERR(clk), "failed to get %s\n", name);
 		}
 
 		if (!clk)
 			dev_dbg(dev, "failed to get %s\n", name);
 		else
-			dev_dbg(dev, "clk %s is %pC rate %lu\n", name,
-				clk, clk_get_rate(clk));
+			dev_dbg(dev, "clk %s is %pC rate %lu\n", name, clk, clk_get_rate(clk));
 		sci_port->clks[i] = clk;
 	}
 	return 0;
-- 
2.43.0


