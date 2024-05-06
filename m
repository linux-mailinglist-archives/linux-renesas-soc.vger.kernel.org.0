Return-Path: <linux-renesas-soc+bounces-5164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D63458BCCFB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 13:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9167A28229F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 11:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5178B143893;
	Mon,  6 May 2024 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Uzbc6M+2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5EB142E9D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 May 2024 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714995636; cv=none; b=sAukGRuhbpweQUiM00tJh67y3GBVotHalgpbZRC7qJxOjG84HRLU7KXGwZzuhpP3UrQUxiDGsQ/o9qpTL8mdyYgVN9kmL0pi+rgdRAY8XZwpBzAQ+uoRyT0+plm59AdLxll7NckS9KoBisdPyktgIk4z9iG+62ihSuNTJiihkmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714995636; c=relaxed/simple;
	bh=Cx+qQfcFxGp5OesTOD7Dtc00hMsXj5vjxdEpJZm+BBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rx6nlpCyVa/p9aTiXjKScSLQ31ANtNZI1dglyfDV3uWM4BQ3rLs8uQ8rK2Z0ucutt1HAKfm4c34KDnqwN8Je7hAn0oq/w9FTqV76RZoXumZuvE7sC/NjSwmzB0h1THHXxShYMA3JXA2NMkbHc1YPbvt73lfstTjM45Ja5PsasBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Uzbc6M+2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=ZCxAXUXWhe/lP8
	ZzWL2nsZSe47Ajm+jt6/VkocVA0zE=; b=Uzbc6M+2v2gBMjSTAQ6DGh08HILRQm
	psDwDwdniyES0MjXhqRava67Pa7J0dDtnxtiyEKEbiEZqZC7USGdB7kAS45ezWWq
	wfZChMkj2AqmJlYErP7zmHirh/ftpbs0dO2fR3EM5GdBcxrP4R7cxdv3SZ5xkkN2
	Rf6XdnLMR7JEI6wO8PdmQEbHRnX795UDO3LCEQSPv5dZO9vmsn3RmtMabNCV6sw4
	J6oQ1fUSU0C6abVw3ldBH/nkW+0+PXMTIJ6DztMXrV85dm6AEHQAnyk1TwHKTI7m
	OlulJp25KpSTzEIg13XL+AUxIPyitp8HHCd75lDVzevtiJDWdrRQYM5Q==
Received: (qmail 172746 invoked from network); 6 May 2024 13:40:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2024 13:40:28 +0200
X-UD-Smtp-Session: l3s3148p1@tVc7iccXXrYgAwDPX0CuAO+oYiCi4tWm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 0/4] serial: sh-sci: response to Dirk's bugreport
Date: Mon,  6 May 2024 13:40:16 +0200
Message-ID: <20240506114016.30498-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Investigating the issue Dirk reported [1], and after the RFC sent[2],
here is now the series with my conclusions. Patch 1 fixes a real issue
IMHO and is the minimal solution for backporting. Patch 2 adds some
documentation. Patch 3 reduces potential race windows by letting the
timer only run when we really want it. Patch 4 is a simplification
because locking should be as simple as possible, right?

I could trigger the code path meanwhile and did not encounter a
regression. But I could not reproduce the initial report from Dirk, so I
can't say this is a 100% fix. Yet, I think, we want these patches
nonetheless. Dirk metioned that his system could have been shutting
down. If so, patch 1 is probably the solution, but we don't know for
sure.

[1] https://lore.kernel.org/r/ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com
[2] https://lore.kernel.org/r/20240416123545.7098-4-wsa+renesas@sang-engineering.com


Wolfram Sang (4):
  serial: sh-sci: protect invalidating RXDMA on shutdown
  serial: sh-sci: describe locking requirements for invalidating RXDMA
  serial: sh-sci: let timeout timer only run when DMA is scheduled
  serial: sh-sci: simplify locking when re-issuing RXDMA fails

 drivers/tty/serial/sh-sci.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
2.43.0


