Return-Path: <linux-renesas-soc+bounces-27447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JwhL+yXd2n0iwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 17:35:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6390E8ABBF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 17:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C89223004F33
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B9034253A;
	Mon, 26 Jan 2026 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF8UqIpt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0EB340A47
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 16:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445354; cv=none; b=hgqnxUuZgA2JaKny+1WCN75c+RW3tHtGtl5YE/qZ/pICNHPkKFYUNPrFBceDOGcSrPM54NAjXyMHdBFyG67+Nqk1srAqSw6fkWuLW/flgu+eumnu/9MNgHcFoPcx/XKl63tykVSy7IEG44Zx/JQ5FDCCCuprxeh81BhbnCEkNbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445354; c=relaxed/simple;
	bh=Mna1b5kAz8ghjIw624fspXXdbrk3TFEMG2Cafli+uto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j1r+q95lbiyWDeRZcyB2NXkl8h+IBmCcy8DFaMIGr/0V7eGYVxH57BIJ4VteC9LxLx2T20doaC+jgsLLBY5rtEu3qatuezjR0XXe48GPgpr5/C4xcus9FMrsCesIZeF1J5cl9mCSeheGqfGUDOjK6hjCu0z2nKj3SohJywSYccA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF8UqIpt; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0d52768ccso31534815ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 08:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769445352; x=1770050152; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hk2UbU4ZBJOe+wfrmqkkKGJQ8vq0ayKVaST0eW8Tj3k=;
        b=OF8UqIptNBWMTfS/SxLbJlNHaj+KB6Tn7G5QfLhDtZKQIwf88M6KYtdScvLc4tE4VF
         /jZHLJgpTWPHZJNyr5pZm2HfPkph5g/Ov0nAFvX0uvKgkW7g9jYKw2fDHhvsYyFM212x
         r2eKpcovHXdEmdFd0JOELPB1WI0sWIK/NNEe047y3Bv8bt4tsROgvKvkLGKe78pNHn+n
         3nhJJESYBXICYLNxl/H3wAQpDvbunXXLW6+BIs7eBf9/J3iGDLLK18f/lcTKpx39kEXC
         2evjoP4upt9QS+lXagf8UV4YDM0Knrh/dKla0Zbyzrxyb03qbRJ7h8yl4OJBkzMkzRrt
         xvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769445352; x=1770050152;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hk2UbU4ZBJOe+wfrmqkkKGJQ8vq0ayKVaST0eW8Tj3k=;
        b=UMadzpxyBvZ94Pnbcs5RfG8gWSSI05hvgz9W059GwKC4Apo1RNVHtygGOpm8O0RWFU
         xcwyGpLvgOv3u8s/GkJq8JKEMTT35eW9ZrBzmOIqg7suMguHXLhQW3PvoJ+OqtNQJkHA
         chi61c0YdZPuxfao4Fv5xC8hwEggjFoyu6org82KN21vAKGmRiZNxaDKEI1d6WX33ij/
         MOJcHig7AcNAgCMHjVjAhlNKpIxeSteSHrv7A/0oy+m8UjVntrWZvAvQjfBBYJeOg/0d
         Ml27xjlbC9GM3+K9jlAo+KZSxGHR9koLnvyFD7w+W7YV0ZxgjqsN6H/armMtTzDwkQYN
         LB0w==
X-Gm-Message-State: AOJu0YyhIj+zHFkU+CWNO57D0JcXhwlXRoftkWscXV7iXZeXapxXdGLq
	oMa28wriX+emCvN5CKCCmRr6SzOJgwM7ZgaMb8YRn029chwVgUQpq+JB
X-Gm-Gg: AZuq6aJZzQm81aBezamCjzP0yzzWYp/3UV1T6QGKyZactZkqE1UML0PDSv8LN9CFVld
	17bnrPAcvOWFA0a/qPX/YMP532wx/IR3bblywRWmzfp2MUiFIJ3UkONTNTWiR6RcIEnEF786AX7
	tyWpMolRyhPItR5AtNLKMhwHO6CfL4ZX6HyDUH5vPdJS+AEN4WwUiIgKdkvJgJ9d/lyg0zSbrJw
	zsITwPdjsSyFrvjCyrHhHS6weCUE2PKF+GabgpNUeGvO475pbFYlY3roH25dORZH+kvqGS/He5A
	YSqaPgMZoj6c2BbrVXgVDkm+iFuRwV5TJWA00KUYy0QE+j8xf14RN/4MpKtHZO3XHjEn7pvyEQQ
	DTsoNbeTKVCi+UOOEXqRzvvPi2HxBx8iz7gsTrG/zhBL/K7hDa39CJAlVosgjYKxuDxSWkz60Zw
	WZ2PTnwXaGVrzW3azb8an3iDU=
X-Received: by 2002:a17:903:11c9:b0:2a7:a98b:9fa7 with SMTP id d9443c01a7336-2a845262075mr36743035ad.25.1769445352184;
        Mon, 26 Jan 2026 08:35:52 -0800 (PST)
Received: from junjungu-PC.localdomain ([223.166.246.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97902sm93417515ad.57.2026.01.26.08.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:35:51 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 27 Jan 2026 00:35:47 +0800
Subject: [PATCH] pinctrl: renesas: rzt2h: Fix device node leak in
 rzt2h_gpio_register()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rzt2h-v1-1-86472e7421b8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOKXd2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMz3aKqEqMM3eSkZMtkw1RjUwsDcyWg2oKi1LTMCrA50bG1tQAVFt1
 pVwAAAA==
X-Change-ID: 20260126-rzt2h-cbc9c1e35807
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linusw@kernel.org>, 
 Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769445349; l=1258;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Mna1b5kAz8ghjIw624fspXXdbrk3TFEMG2Cafli+uto=;
 b=XbKbigKNd2Wy7eO1t/EufH4otWDoSHXEWV9w8nJdG1n4sjhWiZ7S3SFMmHEwnOQQJ3zo1jT5i
 xvDvGVuyAapDYLDWppSuEogti5cyv2IutfS3OFUW4uiTmo7xfkvtH7j
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-27447-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6390E8ABBF
X-Rspamd-Action: no action

When calling of_parse_phandle_with_fixed_args(), the caller is responsible
for calling of_node_put() to release the device node reference.

In rzt2h_gpio_register(), the driver fails to call of_node_put() to
release the reference in of_args.np, which causes a memory leak.

Add the missing of_node_put() call to fix the leak.

Fixes: 34d4d093077a ("pinctrl: renesas: Add support for RZ/T2H")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 9949108a35bb..5e0586d45cb7 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -833,6 +833,7 @@ static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
 	if (ret)
 		return dev_err_probe(dev, ret, "Unable to parse gpio-ranges\n");
 
+	of_node_put(of_args.np);
 	if (of_args.args[0] != 0 || of_args.args[1] != 0 ||
 	    of_args.args[2] != pctrl->data->n_port_pins)
 		return dev_err_probe(dev, -EINVAL,

---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260126-rzt2h-cbc9c1e35807

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


