Return-Path: <linux-renesas-soc+bounces-31880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIXqAlJM9ml7TgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 21:11:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0693A4B34BE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 21:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C17F23002934
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 May 2026 19:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA7838736A;
	Sat,  2 May 2026 19:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qJfkFdCy";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oFq70afh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E4A2DAFAF;
	Sat,  2 May 2026 19:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777749067; cv=none; b=jJvL4jGffwgitwHUd/issxI10rfL0XrdS/eQmdxJMsal90+EMH9ORLDOAL1mt0RxJUu+YnvX+y6kPuEkoqrrZwKvLqxXISZ6yuqV1mluduYNA7V35IsCM04U8pR9TqAld8ezxZ7vrtJdYh+rf384yZW1gJ7BRcWgQTzOpT93AA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777749067; c=relaxed/simple;
	bh=Qiw4RBoswBc7nMCyhSeb82We+1EY3WOPQkoHyyt1pHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WHmeDVXes4OA5eZF2oFG/xm/jMNDNY6SePIYOsjV338fi4lmZ8ggT/aqz58v4AnFTCnlSMfooLubyZZQwov6FQ+vf5gyvfzZUW9hMeSNdFnar2+o8MflrctJQLp1BxkosM6P6ZrCgP++W4o6cFTwmc9J+RO1WBu4oelThBObpi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qJfkFdCy; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oFq70afh; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g7HYs6KRHz9tLw;
	Sat,  2 May 2026 21:10:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777749057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eJLlQgg1+xY4acv+ZQ7XvzMwbukD2Fy0lOET1zuXnjM=;
	b=qJfkFdCyFRZfDGNXZ+joYezuAHFNLnI6qyNb6mQGXGzHK5IOx3lga/fdI0K6jeXBFNawcZ
	DoeKYmhzQHLeSYnE7NJDOJlgLDQI/k33MI/LuHbYoeeCe0k53mXeOEUppYCX7hDpuz4PC2
	SrEHS5XNRNMWhLtbOwD0V/wfnD+HJEUz+GjrUPTDd5hCtItcoKRFuLd8sel4Mi7a/jLtUQ
	4J9f6+I3uTOFlIUFTNrdvt1gQAkAyIrrnZhBaxoudtgAU+GOCQCwhy8t/OXnW5pKNaMyRm
	xpxl2fr8JNt0RfwWcaYc4yhzOip6BXgVozENOABARiVwR6TNXpGleT0iiuPR4A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=oFq70afh;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777749055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eJLlQgg1+xY4acv+ZQ7XvzMwbukD2Fy0lOET1zuXnjM=;
	b=oFq70afhZKW9PC7SQO6qXTb9/zNwjfN1iC8jKoBzTIIaq26a/+QYRhIafzRUYH0ekVxMHx
	sQXTUjTkAzTCwBPycHaNYMBvl7bLVsWk6xuf2ZZzimtynCD35ypI1Hk37spH8PHYdt1Dn7
	V/yaacNX9OUt7Yht0BoDG2GK9FrT76SC86t0AzU4tCAVvrJbwLtmv/fUYGwsfSf6NkI3la
	YB4GPcsogcmHNld9ckKkYDXyhlEHvV3kepf0wdle093YtOx4jsw4gh4mHoFsyqP4o4X1T9
	9PAYQUWMC31G4dVJX8ZZJqM12mzJyDITVx7LHFDQ74dgyftn687zptlzPhlDXQ==
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Joe Perches <joe@perches.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Rob Herring <robh@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] checkpatch: Update DT bindings should be a separate patch text
Date: Sat,  2 May 2026 21:10:11 +0200
Message-ID: <20260502191052.94729-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: icqrt8x9b1ag1frycokrb8x3ga47sysj
X-MBO-RS-ID: 6172f0492eb32475ab6
X-Rspamd-Queue-Id: 0693A4B34BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,canonical.com,gmail.com,perches.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31880-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]

The current message can be slightly misleading, because it triggers
on a patchset which contains the following sequence of patches, even
if the bindings and headers are clearly a separate patch:

0001 ... patch which contains the DT .yaml bindings
000m ... unrelated patches
000n ... patch which contains DT headers <--- this emits the warning

The intention of this message is to indicate, that the bindings and
headers must be in the same 0001 patch, and the headers must not be
in the separate 000n patch. The patchset must be structured as follows:

0001 ... patch which contains the DT .yaml bindings + DT headers
000m ... unrelated patches
000n ... unrelated patches

Reword the warning for improved clarity.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Andy Whitcroft <apw@canonical.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
NOTE: This comes from discussion with Krzysztof at
      https://lore.kernel.org/linux-arm-kernel/d246edd2-5f9d-4e95-850d-abff175088a6@kernel.org/
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3727156e4ccad..e505ba0666bdc 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2957,7 +2957,7 @@ sub process {
 				if (($last_binding_patch != -1) &&
 				    ($last_binding_patch ^ $is_binding_patch)) {
 					WARN("DT_SPLIT_BINDING_PATCH",
-					     "DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst\n");
+					     "DT binding docs and includes should be a single patch, but separate from this patch. See: Documentation/devicetree/bindings/submitting-patches.rst\n");
 				}
 			}
 
-- 
2.53.0


