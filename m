Return-Path: <linux-renesas-soc+bounces-32837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFH5A1u0DGrClAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 21:04:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB32583FCC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 21:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE98E300A646
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 19:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CCB3DB328;
	Tue, 19 May 2026 19:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bet8Qz6m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F67B3EA94D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 19:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217491; cv=none; b=PWrLKFFpgLMsPm9taCvW0ZOsJbaNX1gdGXMzYNkg6bYepLP3kG57O9FEY0EemfCbtkCQzPr03Yr76SX8G7LD/flGbxo6srBmA3aFsoS04ZZP5Wflbai+K/XyUKNeBHM7OFv81iP3kJEUJA8y7SQkxiF9EwiiAbSIbhSLDhWAu20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217491; c=relaxed/simple;
	bh=ClGiD7Br2FRvKa7NIj3NIRbaGiCBSYKP0ikEdtKtThA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dE+VmV/duM9AjQM0ETBb6QQHfiIeDG805nV/JcRe3i2utXMo7iM+qoUJd4O1q55bOMfzzPQgugjZHZPEdomBlVb7skgT6m9iG621SmDfQ/BBlvD66WE/Guebp52uECK6AS3Fw4/5CxPh5cxxJ7kyNuZlvcWJMPRjgaLSaaOeEcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bet8Qz6m; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8021c8c42fso1626600a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 12:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779217486; x=1779822286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lt4E8/DsuDzGzbJ8IpIkgEnn/bBtXFj50NFYiiBCCoc=;
        b=bet8Qz6mLJZkQhRiQ6ClI5X5+FaACWevEv8HK96i3nHF1yAGmEcw7OlJaSwhIj+DCA
         N64NaZIxluUa2q3k9Q5AnHI6CFbzSmQHstj1JLaViJF5Yc1tR+obQYealfOVxxTLWM4u
         /wfF1MP83Qr7vOo+P1OvYyiv5tj1ozdN+dVdcaHB64cPxwiPqKS/j3Z7hDZnoMXz1RYW
         UzIcBaZ5+jLVjHpKsQWHtqOeXyuk4SvQQP+MxrocRg3tyY3ryVFtwZjh3lf8BiOnoKim
         iGj6vR4UijHyyyNk5lTZjOo3dxFC+P8ftmTRHIOAdofVFISb3Kg44SrM8RG4yUgMzbbr
         54Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779217486; x=1779822286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lt4E8/DsuDzGzbJ8IpIkgEnn/bBtXFj50NFYiiBCCoc=;
        b=ZUxyE8ONKQU0VDapZJeqrDE1WxSSNRHrpPqctqqp5ZySQ4CWODwtt4U3FI143c+IUr
         f2vzJDJ/4SF50amKK678WU+MgLbz1x8uvNnOoCrea+z8WhjVYcrFHx4bL0ym3nzGbUZp
         nn0m0EXmKw945ZN3UBnFVE8GsA4pJH7bF9/nMQR6iudYw6OR0vIeJjXzgiHwbgqwbHXT
         Pi7L2N4kWhttsjEQKkmJ5Khha0MRBfOKPyulMFum72XXkriyYflR2M5uKvfyKpUUUxX5
         FS+gWYaa1H/RRKWEHpy/BgSq2mwefzVB+MrsojKQGw5F8fPKy8M4f93oAM2fcZV+r0th
         gJ1A==
X-Forwarded-Encrypted: i=1; AFNElJ+ChMStAHJMgqFyAd14UJ9SAh9AEm/f5CXDXpdBiMdRa+FDSpNc0I25u4Du3UmvKzlFj4y+7DhS9KL85RDNS+3/xA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj4yioPZB5Ef5aGEwvq2D2huqBp4Zu/xfr2fitUO6ebHJDMZay
	9uy294KGUBh3IuTbcARlQ7BKaDQCE48ngZjxTLoV8icqgqi2Ua1ogRKs
X-Gm-Gg: Acq92OH9/IVHc8MrgSDVcKxOS2XtgtiTaaackFCQR09/psM070jA2QpEWry/gJ16p/4
	TkkqnJyVyJWh7fbuaFXw7mjhB5lGS/pcpwYSwXD4BLFtnI5d9F30MMKuZ47GWuuwVuaKf+roleO
	SDoqHwTf7VW7SxyTLA7ghcrN7ureFk9a9p41a9N3fi34NMO03sBc83vLNHWaGuIUznbplJJocpg
	y9hFJX00ctTBd1wAF0AyHZugd1j7V5wGRwfHFeT9rVfzV4JNnRdgHkWNPyZ3SQlT8+zzm41WbbK
	W127zAHOJw14SM27vcP5qqFt2/b33GOfvtXNScGIqsR28L2OKDzF/MYPwfRhuRusvVQSoL3aXUE
	9QBeTGjAQwgWYJ9O4GuyccRZzfMdKqI8i1a1D1+7hknW142727qKRYzKxH7eIlhRtDJqNAe81KV
	NZ6/MCrH5e1obQwnIeLbdt794Afk+eUZSJvmLi31K9GwXIc1Z1Pps7xEkMiX8=
X-Received: by 2002:a05:6a20:9153:b0:3a3:171f:6b23 with SMTP id adf61e73a8af0-3b22e14de52mr23831258637.0.1779217486164;
        Tue, 19 May 2026 12:04:46 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm17317550a12.11.2026.05.19.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:04:45 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: dmaengine: dead empty checks in mpc512x and rz-dmac descriptor pickup?
Date: Wed, 20 May 2026 03:04:42 +0800
Message-Id: <20260519190442.2382986-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32837-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,maoyixie.com:url]
X-Rspamd-Queue-Id: 0DB32583FCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

While auditing list_first_entry callsites, I noticed two places in
drivers/dma where the developer wrote a NULL check for an empty
list case but used the unsafe API. The check is dead code. I
would appreciate it if you could take a look and let me know
whether these are worth fixing.

Site 1, drivers/dma/mpc512x_dma.c mpc_dma_prep_slave_sg()
(linux-7.1-rc1, around line 709):

    mdesc = list_first_entry(&mchan->free,
                                    struct mpc_dma_desc, node);
    if (!mdesc) {
            spin_unlock_irqrestore(&mchan->lock, iflags);
            mpc_dma_process_completed(mdma);
            return NULL;
    }

    list_del(&mdesc->node);

list_first_entry() returns container_of(&mchan->free, struct
mpc_dma_desc, node) when the free list is empty, never NULL. The
recovery path (drop lock, scan completed list, return NULL) is
dead code. With an empty free list, the fall through pointer
aliases &mchan->free. The subsequent list_del() then corrupts
the head's next and prev links.

Site 2, drivers/dma/sh/rz-dmac.c rz_dmac_chan_get_residue()
(linux-7.1-rc1, around line 726):

    current_desc = list_first_entry(&channel->ld_active,
                                    struct rz_dmac_desc, node);
    if (!current_desc)
            return 0;

Same shape. ld_active can be empty while a residue query races
with descriptor completion. The `return 0` shortcut never runs,
and current_desc is then dereferenced for status processing.

A candidate fix in both cases is a one liner. Switch the API to
list_first_entry_or_null so the existing NULL guard runs as the
author intended.

Similar dead empty checks after list_first_entry have been
cleaned up in the same shape, for example commit fbb8bc408027
(net: qed: Remove redundant NULL checks after list_first_entry),
commit c708d3fad421 (crypto: atmel: use list_first_entry_or_null
to simplify find_dev) and commit 10379171f346 (ksmbd: use
list_first_entry_or_null for opinfo_get_list). The qed commit
message describes the exact shape we observe here. These two
sites appear to be missed by those cleanups.

If this is intentional or already known for either site, please
disregard. Otherwise I am happy to send a [PATCH] series or to
leave the fix to you.

Thanks,
Maoyi Xie
https://maoyixie.com/

