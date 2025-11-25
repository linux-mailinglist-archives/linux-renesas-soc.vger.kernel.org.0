Return-Path: <linux-renesas-soc+bounces-25109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 02156C85A61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3A468351C45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4333328B7D;
	Tue, 25 Nov 2025 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFuC4iL5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3610F32825C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083204; cv=none; b=U2ubiZMIigum3/at/KHqj14cwuopXE2PH3mw54ddA6Pgb8trPfQhvB8vrJgz6ROn+SCdHgx5mBcH+lBumOipbWGMlzM1E9hZgz0Bh6qPZqcqQ+gKyJRLHR10yUSYxX0nNC9d1D+y+AduYyMjWmEs7+gypZBVFnENyiFRDCvhPlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083204; c=relaxed/simple;
	bh=DlZPe72ydNmFt2C1zgFZyeOqdvbjTYNvnFfXWDM4wm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gttezdzqxIWQvpzPfSSxTDvo/o0PF1uR5jibTOGPTfDcx2jMvxFBRyeH8UC0HNQ/TnJzRgscSR59fW7tGA0exQbQolBoIJqthTUUvlPH0bYRuthEzCsJutb2GnOlYSxvQdOG/IrZC12vPudKKIODqBhkbiCa08szUsg/sQolnbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFuC4iL5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so3487703f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083200; x=1764688000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Rlluzn3/8wzTLB254D0PoF4PW+CvpntGETCkInCEuA=;
        b=KFuC4iL5dCo1diehnQGoNC7lsrZ9f/bGj753YyBfhKxWwN1up1H2aye736zmY9sQpO
         boH7kfYgqOXKQFYQvTgPwjOC5nRiN/zzqmBvNLymLzJx0vd0VOIwRyL4gAPtaWyS8lyZ
         J9fJ2wenEXIOjIU2If2/YdI3+9f5msTQvryBB5aDbD68tNdKHVh+Rm8rDeoGC6RbnMr/
         NZYmyyQo/652U7XhljHTkEfsIDOhaua/ShguZtF9oGiGImz/jzuYIiyKwMuTe8bwwU69
         vkINYHRvlyIdj2IeFegI6N57TjyR8jZmAuTkV41JFY82Qh5aZprWRgMOYzIFnS6667EB
         8BaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083200; x=1764688000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Rlluzn3/8wzTLB254D0PoF4PW+CvpntGETCkInCEuA=;
        b=rbkGIg+6OP0AG1V2QOKULzLAHcOAcLPJ6Sk/49gA1l7F1+et8BY2kK66AmMHVpq3qm
         L7UbneMS+0Q9LMaqvmzpvCAyLfGbPollH6tM7O/8ilfu3DWlSDk+7myDz5SJhmprGTyR
         Yqd9YPVqHckFvwWA4KYeWhFRqtym4IGbcIo27O+siaeQKwblbo8vmfuwNPYfm5MOGNA+
         di6hHJJsVP7QBBLVHLDPu/DmPVgKsqhVOh2UEDHTfg9oS8yULsl08fATjgLw9QDyNvxD
         Gb3xTYex/VF4CvfvByb6XTJgbJNjO8ze4R8OOdI9ZhkCKOJiFFWSg05ycl058LbG2cW+
         Uljg==
X-Forwarded-Encrypted: i=1; AJvYcCUrrHIspWmHLZd9GjHnhUGi+vUpEPfXzc4kn8ImnD/byi4emN8RsxRUJ+T8rpK7QPEOFQxScS1SI4lT+5T2QlTCkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf37itijrTHJD9tyrtHC895y+9KukDGmzRioUSql2uSx9ExgQ2
	T/xPXefmkFMx8EfRcv4pyAuYzL3mUk40Vb9TLY6kz50Bs7uU5DB307Wb
X-Gm-Gg: ASbGncvAlu1XgXPMSu7RIiILnSREAJ/wNesZLsNAgxvTND1MvhZfv8zZEcEKjaA+eWo
	J++LBAkEk4qlWGQa/RWtGU21+/VTpM8YvunjklUP2NOiE8U2sJjs4SWiBkLeexcay1A8MSTiqED
	b6b0/r12shYrfJfG+zbK7tkkbGaq5Lu2qhK1VvelMv/qZ9r7lyHQBKQCxEZSsVZNrkLCS0EV0i2
	ng4JNMuNYMh1zYmZpuqCURgY4EqOKl/98gENOk4OWJCIF7NpSQz/nkNMjgZKKAi4wsAhjZPCYiu
	1mNgzSavC7nEas3UlbcpVYdfII0mbaPE8WD1CO9KLWnRQCTb76daWB4LZlqwIfM+WlmUFzF6SpM
	qeAMzv/8ESy2SO+K9zKRnwC1qMmg+Niz64gowxIi7ciCylq6oKsXHspjKDVNsAb2TvAcv6BoTWQ
	AOh8ioAS5YcLA2nCpz8/tPENvcnOpDxw+rzvkr5sr8VEv+FBOVDlnDzjwr4zFUD3ADN1QrWVIrt
	TW9dBZ6LHiiANTDcXjb
X-Google-Smtp-Source: AGHT+IEYuuqBJt6IQ5SKugNqfguxbkVvrDhQV7s8xm7GSKb0ozEZv3+VMrcpsMtScekHxRwh+8JtJQ==
X-Received: by 2002:a5d:588c:0:b0:42b:2f59:6044 with SMTP id ffacd0b85a97d-42e0f21e9e4mr3204631f8f.17.1764083200346;
        Tue, 25 Nov 2025 07:06:40 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:39 -0800 (PST)
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
Subject: [PATCH v4 06/16] serial: rsci: Drop unused TDR register
Date: Tue, 25 Nov 2025 15:06:08 +0000
Message-ID: <20251125150632.299890-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
References: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the unused TDR register-related macros.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected tag.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 3ad6cb8e1d18..5d43e8cdbc0d 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -35,12 +35,6 @@ MODULE_IMPORT_NS("SH_SCI");
 #define RDR_FPER		BIT(11) /* FIFO Parity Error */
 #define RDR_RDAT_MSK		GENMASK(8, 0)
 
-/* TDR (Transmit Data Register) */
-#define TDR_MPBT		BIT(9)	/* Multiprocessor Transfer */
-#define TDR_TDAT_9BIT_LSHIFT	0
-#define TDR_TDAT_9BIT_VAL	0x1FF
-#define TDR_TDAT_9BIT_MSK	(TDR_TDAT_9BIT_VAL << TDR_TDAT_9BIT_LSHIFT)
-
 /* CCR0 (Common Control Register 0) */
 #define CCR0_SSE		BIT(24)	/* SSn# Pin Function Enable */
 #define CCR0_TEIE		BIT(21)	/* Transmit End Interrupt Enable */
-- 
2.43.0


