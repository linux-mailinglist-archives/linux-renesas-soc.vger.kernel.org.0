Return-Path: <linux-renesas-soc+bounces-5828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED368FB9D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 19:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD072282A3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 17:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F33149DE9;
	Tue,  4 Jun 2024 17:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXexvQj9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA200149C7E;
	Tue,  4 Jun 2024 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717520745; cv=none; b=ughEFwcjiEDSIAJRgptcdT/4i5mXtgERY0VOdL42EDX77HTCJQNSpTQoLc/AFAB3FuwUTmXeeYMTA/fu/WBqmHEyfFjrMFsb5Abxc2piT4qmJKBO4xup2SsQa1s0sKSetdXPEUpASHWaoD2qxyLhirBoAKpMjR9HnzDqN0k0vYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717520745; c=relaxed/simple;
	bh=t9IVtsFePdlpttmOU4a5WpS6hMzeoXmyIQ0CJUC+xQA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tgyisdxFj5NBCBeB8hnyacAAEK+7EcHzsZtFd03VdrVrUqsVOGdkJ3SBOARngSmobTEgMcWPbOfPmnDJth7eWA7DSO74T7Lzb5WpC7qqXdzjgvTiJi11T76dK1nMbo+mDYJDIQRJ6OaJoZNDEXCP05o5lbHvAswxcbpEnGTWabU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXexvQj9; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso5756808e87.3;
        Tue, 04 Jun 2024 10:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717520742; x=1718125542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ooTOrfVE1G77riynjLsXH5hVGEdf4cn+UvIXHa74yk=;
        b=BXexvQj9ZGNWUhabz+vADi3qCrh3kAFspAKPYl+uE1vH62+DWU5cM6fKW7TqWG/P79
         AMiEqQfF1K5Pb4w7LAXPxvvTPMTROSKK2K8cQQLdrE0lPFJPNotqkgCpMSQVwn5UlfbM
         fzoZh89dt4ogt55fG0x41CtvrDUGX7WbByLKDamztB5BSVnj9jjGMLtrMYVkBduENlS+
         er7FyWTANX7T53MICPpbCIgvUpyroRKYJso2JfaBWHA58sI+d11BAGYAQ2N0FbUi3VHE
         br0MY9LD9RX3gjWhC3XAJFMHBSo6kiKso0Lq3/+qsovgT9AgiHDPLVLWevXPhq984M0z
         7iVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717520742; x=1718125542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ooTOrfVE1G77riynjLsXH5hVGEdf4cn+UvIXHa74yk=;
        b=OHrntdMzmjHiFYVf80O8vn/6UGll8H/nlPebyWpsZnZBj9njzVkDjxvmklLBdCPt7Z
         TCL6AZTW9VKkdiNnML23Gy6bMXWiUJzardUaowtLrRIBf6549TcalV51C3cLPAsLG8PC
         /rRWNXUnwQ6vYijhqC9RFMaSRz+Qca6TdjNnHTKUv5O1BlprtGHCVLI5HKsNkMkwnQSX
         t7l6JMXOAubaZPDfS5ddDOQUAAIIVDXzeJYi/k9fbq9E/CwGghlvcsl0AsKZRR/zRm5w
         Wn4WYHeXEzbrd7YNIT2bNOvp1yLkommg46KmT3YNVgz4fXYhQiSnliIFPKQvrAowWkfH
         qktw==
X-Forwarded-Encrypted: i=1; AJvYcCXdpsf5YdsbzxiVVSKSkmsDx5WwQncatDbZNckCmHQe0ivopgeJh5odPxkLDhks1+iz4DrdzlCgu2Nf271f+Wu40hY+DztWQj9OFAnRkdjPtesw1HTZdZ1/hF1GdH2yihre28/F6fVr37FnIESDVTCfbo5909oawy0qS1GQT3wtL7pR3bX2LgTDjt7U7vhexWbKyoVSGFi/72xBmJgKu/5JyC19gLIgS4y/
X-Gm-Message-State: AOJu0YyPyw1S83MiowSnvCWxKN/WrnY6Ew9lTlmvXNWlpCF/uAAQJRrO
	gkUVcUsb226aKznbii1fFKWCMimBfsy0ROsMSNTo8RmjYETiMiOK
X-Google-Smtp-Source: AGHT+IF0P8+2G2asyqapUINs+aTvB/wwEy3aI1z09I741Ea3xfCSOlDaqPlAmJfHe7TnUZt8LhBjbw==
X-Received: by 2002:a05:6512:3091:b0:51c:dc6:a1cf with SMTP id 2adb3069b0e04-52bab4cf236mr138303e87.34.1717520741692;
        Tue, 04 Jun 2024 10:05:41 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0f2asm12244077f8f.3.2024.06.04.10.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 10:05:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/5] Add SCIF support for Renesas RZ/V2H(P) SoC
Date: Tue,  4 Jun 2024 18:05:08 +0100
Message-Id: <20240604170513.522631-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series updates DT binding doc and scif driver to add support
for the Renesas RZ/V2H(P) SoC. RZ/V2H(P) SoC supports one channel SCIF
interface.

v4->v5
- Rebased the changes on v6.10-rc2
- Included Acks and RB tags

v3->v4
- patch 2/4 reverted back to version 2
- new patch 3/5 added
- Added new reg type for RZ/V2H

v2->v3
- Included DT validation patches
- Added a new compat string for RZ/V2H(P) SoC
- Added driver changes for RZ/V2H(P) SoC
- Listed interrupts and interrupt-names for every SoC in if check

Cheers,
Prabhakar

Lad Prabhakar (5):
  dt-bindings: serial: renesas,scif: Move ref for serial.yaml at the end
  dt-bindings: serial: renesas,scif: Validate 'interrupts' and
    'interrupt-names'
  dt-bindings: serial: renesas,scif: Make 'interrupt-names' property as
    required
  dt-bindings: serial: Add documentation for Renesas RZ/V2H(P)
    (R9A09G057) SCIF support
  serial: sh-sci: Add support for RZ/V2H(P) SoC

 .../bindings/serial/renesas,scif.yaml         | 136 +++++++++++++-----
 drivers/tty/serial/sh-sci.c                   |  55 ++++++-
 include/linux/serial_sci.h                    |   1 +
 3 files changed, 154 insertions(+), 38 deletions(-)

-- 
2.34.1


