Return-Path: <linux-renesas-soc+bounces-24648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2CC5CB9B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 12:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE2EF4F3340
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CBD3148D9;
	Fri, 14 Nov 2025 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9/dx3Va"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B76313546
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117531; cv=none; b=ES0iRCHaPpOArxu+3C/Fb0rN+6cT4CFI4W/r4hrdPq1SeOm4WajKnOVf0FWDmhMGysoQdwsr/rzyvmi7k8GnWxMfVgjgjCTyPYEruGfuNexiL9Xpe5hPNPwycAz5la1RNcySlTw9gfL/SqrNOxamptqGTTXd9pcx9zjCoKrHXiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117531; c=relaxed/simple;
	bh=iJIaTUJBE/UoXRoL2SViHoaSHk5UckBwxok5OzHcObk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I90GtaAdleJOczPSAg9WkQM4VwbdbKmGiVbgFtK+Xyi7+ZStq7hlk5Gqi8yRdAWSB2WOE9arqDla3hGU68YCuss9AxWI1pIUWGl2ric5cw9WNKxUmDDY8ycVK3oYZN7LkAs2jMvmEcjphq+UrgnagVe5ht1ncdT7CL6dVcd9TgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9/dx3Va; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b31c610fcso1575952f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763117527; x=1763722327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYLtJc6vLB0VyHR1vBUsYK5ND0Cpm4eLmmgWDk1Ci6s=;
        b=U9/dx3Va+j27Re9MMMCh8CY/uJxXCrEF+3px10Wc5hUH8mPejPq3hBl+UguNqY8zeL
         YDeEM/ojwwP9/HVzpr0CEOGGte6EzsnptHgsT7exnvvkcqJ752NGY7YEh/+coA1AwZpJ
         gQj/IN7pnkNBQ8+kAUpaCYp2R21eFgp/pmZiNku8XRAclwklaQNx6zyYMArSOsXGSLYp
         L17y5/0FWUW5gfwFIJ3yaa+TVGgopQnQ/ePN8WylkvZdtokPsxPrWmhoShnlTkeHpMcm
         Qqj8cR4IgKp8y36dcA6tIHKsIaFicGqytflNPmh0mhrQw0H68IcFj3VuV0ixu2iNvGAv
         XhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117527; x=1763722327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lYLtJc6vLB0VyHR1vBUsYK5ND0Cpm4eLmmgWDk1Ci6s=;
        b=iimSvrN4cX+TkzeG7u3hKvMWRqO/Blp6KTbIdMYi/fMZh5HcBEDzY51ruapRNnifie
         AdYuNQEI8NTC6Ur59kVJQ9O7P2s/iPXoqkPHdUexyoigsnpV+2ZJ1IwiGZu83TVXBuzm
         SMEjpanhG34DBS7F/xwXUisxwOGeXpsHs0MQutqe8yA1gvOLQIgRDJEPVHjZppCXI6Ih
         cjS7kO94ZH4ZjbjSUSvwZGldCOJYTBrXqKz5rkOmDX9+HpOrJNsCQ8ZjlZAINUPMaocb
         fdIFfV1bWVA5F1hmipBIRiTiWnpH3U2tUXc78ZYptmsmj8b9dVrQZObvjcDcEHfLTva0
         PEoA==
X-Forwarded-Encrypted: i=1; AJvYcCXPNtUmgDaoOBs7KBz6OL0CaNsYiOpVy0pf4uwHuiFkC8YTUT9cOysuOPoUupQqS7P3ZV8yGzVgff3YEOqI+uZhMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRpfB53X+RQWwZZ/65hxpLHNy89oTc8jNm/lxUpOns9q7LF6+R
	yL9/9Cjps7FGc40mQV3KOUotJDtZDqoTdST8lOSzp5aLOV5Gg9QPeDB4
X-Gm-Gg: ASbGncuJAyJBXjH6aotv3yjW0g2DcLNMHDsUpX5eIROG/u/45NHlnGZKa7K8s7Q5XFX
	in/qdIyQR2+xUttbZ3PxQKlj7DW996+cN3928U7bbDko0lUKsmOHOqEjSLH2BXytInZ5ZQVtCee
	SFsuO5rcrjIaTl0T6Y9UOJgU2fgVrrDwq+y44GgLLYzhNI8GtBjC9inWgMJ/I9emk6XaENt2ie7
	HmgtXo/EM2vgFGFEWzAmD6zhR/h/PqlLhtJLcII2XbTzWIBCLgCLNtliyWhOviiSOY1IbX912Av
	103OwDY5igSmkGRiZZGJ+AzouvnkKRcTrRpn+PzXiGC3LW1DgBKBRE6PyZO9XOEyCAV02KesJwj
	lWRVTqnGsIxneBIzPjYr1uPaxQrOKNlrwNGH9g/AHgDoKE1JPktPfCTuArWAwUhoMrEzwYmxgvk
	WGHjbpdcY63c7gVv2dbIW7BOYHF1IAzbJThzT8udISpJ7rykwqRoNtOQ3wVdrosMi8zCvJtBcEx
	fNspAoju/r574tk
X-Google-Smtp-Source: AGHT+IG1K5JXTh8BUK8ltjLvdxEwkLX/nyui+CPvlrYOREjldOz+kK+xtG6KakDboynQZMVOzMw86A==
X-Received: by 2002:a05:6000:2585:b0:427:813:6a52 with SMTP id ffacd0b85a97d-42b59386b4bmr2223729f8f.41.1763117527156;
        Fri, 14 Nov 2025 02:52:07 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm9031255f8f.35.2025.11.14.02.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:52:06 -0800 (PST)
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
Subject: [PATCH v3 05/13] serial: rsci: Drop unused TDR register
Date: Fri, 14 Nov 2025 10:51:14 +0000
Message-ID: <20251114105201.107406-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the unused TDR register-related macros.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 9fa5d387d7db..9609ef73a0d4 100644
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


