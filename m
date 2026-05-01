Return-Path: <linux-renesas-soc+bounces-31865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM7EJrOF9GlmCAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 12:51:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 985C14ABC1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 12:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 465DD3004DAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 May 2026 10:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B99382F35;
	Fri,  1 May 2026 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXlrBhlM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F803388399
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 May 2026 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777632685; cv=none; b=HWNB+Zmu45BPGG8jI4nUljnpuQ9z+9045yvWWYm9wVijrLDl2tAPdY4gag6c1gG7pjamKThDB1LXpjzsOBrYZ4ddtW/q6HoIi9tu3sGQOfQbnjXnivF6dIO1L/XYPY3iJNB1yon2eqACRyksJz5XGxdmsdRTObDj8FQyi9ow20c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777632685; c=relaxed/simple;
	bh=cwZgxxNMqmCCqnCT2BZZVFBDZYiRKnpQeNPDEJl8+q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HdU0Yy478uMpcoumMBPudGVRcPwGpZvkWU2zYuOobnnD0HKoawyFzr4kIzSPdpl7WnixwuFJpveBS370UiuTDipTIaFmMe9xgspnwPayqW7JPjaJzttGL0F/P8NcxytPcYcOj+cR77RrxZeNQbirjteeD4cS+xRN1E+K75vqTTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXlrBhlM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483487335c2so19752955e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 May 2026 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777632683; x=1778237483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XSE9mx8/5dxgsQtGfHZyOV8gnMykOm6sGZtsfo3T6Uo=;
        b=BXlrBhlMiuWH8tAV/miTQgFo8iefz9nyD3eR4vN8aR3YjpYRXOVmFch8+T7xT1vX6+
         cCD4+1zATNxipmef8nG1oYNynpyRZNvmg3NuA7PIgceHbSZcRqgBBnpZQgDG9K70EzjK
         wBFgguC05cb79I3GvIq+RXqQbnYu8TCLjpDBH9W7itRgRqipxWbAabsRRp4PEDk+jAP9
         A7Xw9v5qqGLv3PIROhfgCJID6PfDQwwCJF3G3o3ieq5D5z8DIRKI+NweIuRG0srGCoA/
         YQ67Ohz8at9gEe17K6awquitoWSG7FHUkwvXKLmdGqZZzXi/Jelz3LYwNKoKS2B59WQH
         T9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777632683; x=1778237483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSE9mx8/5dxgsQtGfHZyOV8gnMykOm6sGZtsfo3T6Uo=;
        b=cqMUXKfP29pEl28JwyS+BKF1r4IldGKlxa+pgTC6Y+L+5CeEOEeAeL6pw/R9yHA9f5
         XJQyPFANjf11pjbBh0dOh9BVruNiqRnudKCmJ95FAN2YsPLNjbvsCJmzPLYJQZXHTuN9
         CzaLui0AJ1EI+3YjXM3SoPTQUQpmp+77yHPheu3ZmEJRO0y/7x53VlYRmf0r6M/DdOWG
         6S9fh7s0NhlKYuO+IIAyqfhhD8OC9/r7jvVwvB2EoUbGCFFxLGS7wenktBVIi121EkBn
         r5JjxHVBDtiCF9UKoWVH7NeharACajcR6ex1VYFqRgDXFEz5o3BV//YYna+szJLSuoRZ
         2N2g==
X-Gm-Message-State: AOJu0Yxcnn8DAgDgH7FI9xGMd7qcZ+Htn7c7EUHZwhEtua/LjrEdG+16
	x2PjtPiPBCzho0aKxGOP9qnrx7E486DpgyUFXbE20h6ye+2rH813NmZ7
X-Gm-Gg: AeBDiet8emZcATVl/nEpykA6fWjimJeOvtA5e6BvuN8DzaYDOu4bH78vt7u2nUYDF/O
	rRf4zDtv1P7yIcB23mfbOBV8GAiciv7sH5evV4U1B7p9hoLoorI0DoJHtfxHxMTTPWLig/nw3VD
	hNkLcSHndfW60KmyTYYMuZboKqHndtQZF/got+eVFZBRGSSgFiFFh64SHNpkhUL1Fs6qiQ3aFol
	ErXkKve2rIJaIwxeZAMG+TOs5LKY9h1jEfn208Iax+4NGECuW8rHWi0mNv66CWNgRPnGMllCm8O
	UssIrrdFZ/CbGazcPUo9N3IPGrAHQb0I1zVdTddf74ktUAPOY2VY/tDVU3HAlgD2SqdCcJy1rOi
	CUhQyP1qeQWCGIwp/6sv0/PfspI6vsdAGz/Mm8Ki7eA8sUpWVyqbtZosxvd2bSvlO+OH0D7FXOp
	yuEnk9YRoCTaG6nBLgnPT4vK5LSF1mD7oFCip2Rq5pNDGvxRRPAXepZWZkR8ZddJs/uaNDjgy9o
	Ys87ScE+8Msq/urfDjli+LCWcXeiruS8/8q9Yhnt9Kwadg=
X-Received: by 2002:a05:600c:4f88:b0:48a:563c:c8d6 with SMTP id 5b1f17b1804b1-48a844eb8bcmr105123575e9.7.1777632682700;
        Fri, 01 May 2026 03:51:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1220:5ff:c603:f3ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81b99127sm122313805e9.0.2026.05.01.03.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 03:51:22 -0700 (PDT)
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
Subject: [PATCH 0/2] Add support for PCIe on Renesas RZ/V2N SoC
Date: Fri,  1 May 2026 11:51:14 +0100
Message-ID: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 985C14ABC1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31865-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the PCIe controller available on the
Renesas RZ/V2N SoC. The first patch adds the necessary device tree nodes
to describe the PCIe controller, while the second patch enables the PCIe
slot on the RZ/V2N EVK board.

DT binding patch has been sent separately [0].

[0] https://lore.kernel.org/all/20260501102407.29462-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g056: Add PCIe node
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable PCIe

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 69 +++++++++++++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 23 +++++++
 2 files changed, 92 insertions(+)

-- 
2.54.0


