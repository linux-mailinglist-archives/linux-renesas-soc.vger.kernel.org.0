Return-Path: <linux-renesas-soc+bounces-17043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF5AAB55BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BCFB171C6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 13:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA4228E61E;
	Tue, 13 May 2025 13:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWlYxvRd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8389428E611;
	Tue, 13 May 2025 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142058; cv=none; b=lYiM7diGlw/73dvCGH3NH8+G/kJX+bH0bWLqrySEyoqQhZp63Ve1qja0eTw22DITbOjoDiKm6oX3TR61ZFjYyJOxTGXba8+R+SDF19AU8Dcv9fO22d+exdeOR46NbBmY7qIUTBgsmpmZNCZjXqOJfAMSzLf08Esu7CsnBwvz7V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142058; c=relaxed/simple;
	bh=hzYpFMz6PEQzypuJgh+TBXks5QKrMb8FlaruZc7qMKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V+P6e2w9sHIabyQS5GLotY4BxuRx/WuySSJZ9yINmqsRJNriioC2Qdp1CjP/pRa6CHeA1LyNs/leoS2G/j4sppLdwR5stGjt9xyBJ1Owtjchj0eHfXwsKXXHeba1XYDbozQKuq8SwKYBfD+Ve/7uOrUTenrqyPxbFqfWISxBLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWlYxvRd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a0b637db6eso3376102f8f.0;
        Tue, 13 May 2025 06:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747142055; x=1747746855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hTUBT0w5GEaEnTVNn0rNkm7MAuh5tuedOe/9zO701YU=;
        b=QWlYxvRdNxCeRRf7yo/PpxRoAjW0uD9D0sN3tyunu585tDrWkeIvTJHvXck/l9YGGI
         EB51XN/uigYT0gKcyBW1JLcLQuuOnSoGH7ukrweIK2MDZnM+iEwY5q7zFtur+WWflk3t
         o9fuWDMBDBIgSHqwJqaGhAxu5DtXdLX8RwWRXj8LreqtjH9ktWVU7oEFzEzVH3LESRCM
         kCHxsjmjz8Cr21hQvoojS/260HmnkGSL5KJn0ryosAL61sOwfdvg2/7qSNKvK2TzrcO2
         EjTV+Iw+Pl45ARLpnKRQoENGnFZsOaqZKhSZXx9l8vjSMQwq+ur8TbbspFGzHgn3VWX7
         6d4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142055; x=1747746855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTUBT0w5GEaEnTVNn0rNkm7MAuh5tuedOe/9zO701YU=;
        b=V23xkOMfTRvCdZRf5DGboNReB5f6gzEp5gHO9f/P292KVhtwKas/UJdQBLrHLFoLOX
         u0awyV9TTMuN/nF3CnueTj8P8sDbI9JXs+iP3Jss6XqWtBJaz7pFGp40GEV+wtvTljHs
         cojiCI/eGO1h+0VZxLXAsD/PduJMvfyNW7Rcrs/Q2FjLBg3h6qZErwAJLi9kSucRXCpm
         JJDoaGHI0tTm1H5bpEf19YjCYuXpGtrAZyV/LivPD9CejtETWIik5xJSosdI4ODjPCUR
         T3UzdjHV8nhwP/nDGcFuyZNhoA7oEBTr3mZNmWGF4uGrossIsDT0F1LE7WMiXZBy2O3i
         BBBw==
X-Forwarded-Encrypted: i=1; AJvYcCU0vMlJx/S2nBX5+Y9NCiu8yaageoWQqpPhfwTFXaXC9QGo2tuRC+/TCIEDzqvTvcpWstjBoMVKDS3tqEow@vger.kernel.org, AJvYcCUySZGQq6LXdg/8qQuKi0hwJVndak2Fk//Tx/X7US7hklK0hP8MW56QHd9bYiTaGZ5H/90YWN6e0daU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+v1IgNypVxrS5HMIBhC0HncQOLisy2xzvs6+7FmzcKwujPkCc
	P7tnsnsR4WdOcnztQ8xTQxPY7GvzlOXFnO8z/gy3hXzEMAQExWcgC902w+1r
X-Gm-Gg: ASbGncvsokWR3M3nnA4sgdIyHjS6WOqYbwfbZdh90m4Jd2V7wjYeK4LiCIFe3N6JI9E
	EMMg3I1fnz6FSLrX+o1uWWD7uPXEJ1ZlQ4naRBKUgC9Mr3YgGwa+7xjn0YHS+17su/+Yw7fU4UL
	EC8w6fnEtv1hwixhpEZ+qMa+0I9C9vROhnjBJrQd7S7jlvpbfwyoZSx60JdDPzwS75D/TTzwJsg
	cSDfnsiNsRv+xjwDPpqllBr5dCOyJFvmE6hoKiY/08lfqSktptYKRDItzof68f1jyApwQ+wft4R
	tstZRVmiTDaPRcWUeNWZKliqI8JZdiSnfqJVOZBl4GNcYcdxHc6S00sPVfL+vM/DNisJ9gJna2U
	HbMqUnwJhTcRGDWQQVOin
X-Google-Smtp-Source: AGHT+IFfFbXrnZLOm1LMUciqOqNghquIAlCVEEKmB7KYZmvMF0RFxvW6cqW4Nofb0IMrGZ0vnv5pEQ==
X-Received: by 2002:a5d:5984:0:b0:3a1:f537:45ea with SMTP id ffacd0b85a97d-3a1f643cb61mr14795095f8f.25.1747142054295;
        Tue, 13 May 2025 06:14:14 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c996:6219:e8d3:1274])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfd6sm15910102f8f.4.2025.05.13.06.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:14:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/2] arm64: dts: renesas: Add GBETH support to R9A09G057 SoC
Date: Tue, 13 May 2025 14:14:10 +0100
Message-ID: <20250513131412.253091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the GBETH (Gigabit Ethernet) IP block
to the R9A09G057 SoC. The first patch adds the GBETH nodes to the
device tree source file for the R9A09G057 SoC, while the second patch
enables the GBETH nodes on the RZ/V2H Evaluation Kit.

v2->v3:
- Added the mdio0/1 nodes to the R9A09G057 SoC DTSI.
- Added the mdio0/1 nodes to the RZ/V2H Evaluation Kit DTS.
- Added Reviewed-by tag from Geert

v1->v2:
- Added missing power-domains property to the GBETH nodes.
- Fixed interrupt number 745 -> 775 in eth0 node.
- Added  snps,rx-sched-sp property to mtl_rx_setup1

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057: Add GBETH nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable GBETH

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 209 ++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  66 ++++++
 2 files changed, 275 insertions(+)

-- 
2.49.0


