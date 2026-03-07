Return-Path: <linux-renesas-soc+bounces-28992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CS1kGTmTq2n2eQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Mar 2026 03:53:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AED06229B01
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Mar 2026 03:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32CC6301C5AE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Mar 2026 02:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D792DCF52;
	Sat,  7 Mar 2026 02:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bi7yN71A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF38A28B7EA
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Mar 2026 02:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772852021; cv=none; b=QEd0LOtzgan5XVp0u37AO0cN+eWMkFC07+8AwhxM6HcmHN/kPISBApcM4e/fBjbYeMcYc2o58Rv6gM9jqQVSGnMT6E41AIknEe39cM/yk+JoFLWViFv5mR2n7SqpeW5UMFiZSw9eO4kZ53aktDZUJMBS2iFunq+hefQgRtfpjGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772852021; c=relaxed/simple;
	bh=Vco7MCJ15Eb1qsmLNHaRLNzt184+FcP2M9jgKlhN0p4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IWyAbd+AMeyZxwBctRzmKQmpHQqmiZEHT0xwkViGbYwoSaWrIwhxKhv3UZG/PNohQXMjcusH6LlaSUhCGbK3Xuk70kQ1FoAIrWNGeg7eKa3J6vLTeD1GRrImf9KE1ZvZh2jL13H672PtLnR2i0hfAgVYgN2dfWVYzMWcWxCOjBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bi7yN71A; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ae8979dbb2so4006505ad.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 18:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772852020; x=1773456820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=193j15XFage9v8e5Pr/9GKmDx9DMdhLg6v6zvLBCC/Q=;
        b=bi7yN71A8TSHS6TpgcDYwNcsXLL1VXB22LAdR7VksENPzPfkIu9KeSl5ahYZ3q5Lj7
         iW4hCq+FSARdr1tGdDkZ4U4yxELnZIF7K6fTFeU9poo4E2bOTCw4In6zoTStFgzr+ywo
         67dFHcAS8wYbs0gQ8hpGm+HYAUtW58T9/Ur4AjtUMpw0PAh7cz4iRQSO6M6UM7jQ9OJJ
         Vpc3tSO4Wz9VzWIzkDdItI8agL71V157vWBgRsHwZb/DAsN7F2bFmmRcdbld/xERrbMX
         Y/bgJIlW41GI3ypFzbZOUIGRNfVCkZdJ2V1tFdvpZWwRd760BylHU2jMIRHltz8Rrdh9
         fqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772852020; x=1773456820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=193j15XFage9v8e5Pr/9GKmDx9DMdhLg6v6zvLBCC/Q=;
        b=Cz0gp1l4eE+5IPoyOys3POhpIF0pLxIqi2ZWx9NWYMbOszEF6R7yNJTfpXj8aqEL0X
         6+o9+/osbteTc3l/r9VqTSh9tvHD39f2dLz7/szuds4LLQz2UIDBNVqjQb+qU6xhPCF4
         T1elGEM6id+YIEjH0xapplxKYWx35RBZaXukNbjsY6m1ITIzKPV6u5/ewnXUt2gBWKjm
         A9+M6SLKyfECCx1s/cHlILrHr3Dl08eCyETSBevxKp0mnZ8Sa95rBMM7GjYyoP6QjLtn
         P7gg1AEvKCtytzVmq4jpVgH8ltU1ngdzNdcOFRBE5g4wxG+6uSaLi3EsCHjU0PFK3Sxv
         rwfw==
X-Forwarded-Encrypted: i=1; AJvYcCVvGwndJLro5PK38B++cxYn6Y35gAphYFoTKWtBxVWp1WD28pp7A1RMFdyzhcI0uPaaD5/MydZnSpyXi8fopSUQCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc+6yu/7BCmg5KGSBjnMdGkaPl3/E42C3b7k5t59bkYO/3JwK1
	9+oInBZ8vnnebbhyHs6q38z+/ZYIUzFZAU8JLtY/Lu1tzu4OR2pAKXRy
X-Gm-Gg: ATEYQzxLhwFwN+F7UkRLxydqKzmDoTi4h4hWlnFZOLKcP4YoSs47oJzKY38NdGvx+As
	Fy8Ekxw8FUwi5NQrY0gWgt8gHYffWAVZBdD9n5XoyENpO80XHM7sRDs31mL+qI6gzfG1l1Unmlq
	7cmmRjSTtZrQFA+03J4djp0Wb68Tc6gJrvS7fgjO/MNMYgp0r0G40Ea+IpedOyKBJDl9UKLdsf3
	pdlXEJ+nUNCmqbRflItPmMB7iWNz5oWzxtA/zJaIFDzzTCw85UQcv/QhBJzQ1jsKRndSYSdEDR4
	m0QKYe8w9HG7kDIjIUhI8VDIOwJE35GB13zUTZ+xAxDb/6r0cwECOQtNXBXGhGUbMEVRvQLsiDX
	6+J+CbDDm2RfKddrqFZwPcDcJtsPS/7SOuIx0uHD/bmW7q9KZ9DQi165Ml706XdfdVS2ZaJu4CT
	JV+0SA1qFUEkfwMrMkBuL9ubeeC7D5dN7y/z2qntEqbOSGOVtHSbBcSA8kdGH/h2Lzo93s9zact
	tPkoGBMKxam9ZA8YQ==
X-Received: by 2002:a17:903:2308:b0:2ae:606b:bd98 with SMTP id d9443c01a7336-2ae824dd28amr46174205ad.26.1772852020288;
        Fri, 06 Mar 2026 18:53:40 -0800 (PST)
Received: from localhost.localdomain ([2001:ee0:8207:3134:c1c0:ef7d:b1c8:1597])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ccb6csm45528445ad.92.2026.03.06.18.53.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Mar 2026 18:53:39 -0800 (PST)
From: phucduc.bui@gmail.com
To: wsa+renesas@sang-engineering.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	geert+renesas@glider.be,
	hechtb@gmail.com,
	javier.carrasco@wolfvision.net,
	jeff@labundy.com,
	krzk+dt@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	phucduc.bui@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH v3 0/3] Input: st1232 - add system wakeup support
Date: Sat,  7 Mar 2026 09:53:33 +0700
Message-Id: <20260307025333.1594-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <aaq_Rft0gvVqxmMD@shikoro>
References: <aaq_Rft0gvVqxmMD@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AED06229B01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,glider.be,wolfvision.net,labundy.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-28992-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:url]
X-Rspamd-Action: no action

Hi Wolfram,

> Krzysztof already adviced you to not attach new series to old threads.
> Please follow this suggestion:
> 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> 
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
>

You are right, and I apologize for the duplication of the mistake.

I missed Krzysztof's earlier reply while I was preparing v3, which led to 
this incorrect threading again. I have already replied to Krzysztof's 
thread to acknowledge the error.

I will follow the proper process by starting a fresh, un-threaded series 
for v4.

Thank you for the reminder.

Best regards,
Phuc

