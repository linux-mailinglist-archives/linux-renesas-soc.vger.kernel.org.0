Return-Path: <linux-renesas-soc+bounces-28991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEViGnKSq2nWeQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Mar 2026 03:50:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1798F229ADA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Mar 2026 03:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA8F03041BD3
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Mar 2026 02:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A242DCF52;
	Sat,  7 Mar 2026 02:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxvKbsJ+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E362C28B7EA
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Mar 2026 02:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772851820; cv=none; b=WiLi+fMyMCDIgYQMtyQeoSIGX6VVgnvLTKjdga391LFd59UZRkjlhYLunMgQp6nesic/gBMShAl4Wwt/fVFBuW1oZUIozOjvtjsj7tpI0nVgUhZRKjKK5vjBaKPDBiOYW1mmIRSr2Erev/YmD9rCMpBDeUV5SXOW8mjllfV6eLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772851820; c=relaxed/simple;
	bh=lk2h+apOO3IJRH+msqUtPdH8EFN4HRYrGLzxyBLLPJI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WAtuDNvR3ihE0dQTFe9f19JD3BxE9EX3J1k8d8Pi9od8hDvwBd6WZ/9YHTAxpRFjbkACog7KvzYir06EravoZG2r3Sv7cG68lOs+CJ9rKv/13ByG7xRhxDDF49XMBpNangwy5eL66bsnIBbqB1rIiVXS9ozioSAccXhEAL1vxoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxvKbsJ+; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82980945556so1186873b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 18:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772851819; x=1773456619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbPWhHn0q5436GJTGEpUj7I/Dk6nllWjPQ6fEPdh+4o=;
        b=GxvKbsJ+BZySsoevjOZfhqhytMRyrbkmrMQNbaXTjRJ5Qi3IDcPhUNxr7ebJDNPWPk
         AlceA4dlF9cUl8/h8Ww91c1i0rZ2wcRmz8LIiRbsw3FWHIWqEPaNFIQZMHksQI6klt8L
         VWxqqNREk1TicyxIWkm0JZB49vpi930RBGgMjDJqInvn1bOQpqZfoJyNUaa+O1v/dpM1
         bFXN7uh+lTVCvsS5m87CFDzYrjhOTnIow0I+fFabNzLiZH5vvbGIbvYbi3wSQ5hZSYol
         ANxL6GTEbB11PyZBpuzz2OUXYvfTZ451tbNwQSoFb4NcHA77sfv1q74AU8X0ECjjbFzf
         WObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772851819; x=1773456619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KbPWhHn0q5436GJTGEpUj7I/Dk6nllWjPQ6fEPdh+4o=;
        b=F5k9n2DlGyUtfo6jNoBphmY9WAAnyHXpn0jV+aLVsE//RU3euv77gM31XVyPy0Tp3f
         iHxt/N4CsFADnQMfWkneyhm3Gga6uo9ZHFGx4lCQ1diITmkCiqStPJNHQE6mPWDq5gYy
         zns4sKQkSbA+JBHETJIlV/lMKVv4gG/jpqEuU2TycbR/YCRONYM3+FqUPUIRV6ungDcI
         VZppI70O2PrYDLWkO3tqfCu/3/ccoekBmbu+5umyO6o+72WlTAfzcAQ4M/NqzPNQr3du
         xmzNm0IGSSx2dYvGUhL5mVjgrYqeXrUl1Y+OvsAsFK+YQWcOhYFTgIJN4v1dOGimdw3l
         of/g==
X-Forwarded-Encrypted: i=1; AJvYcCVOavkA/a5UezFHy6yp4VDyU68zifrXT6KVfU2nul45IHOEENQhULrivc3PZc4fGvls0scGY4oPH1GLDt4NMdAu7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFHlxvtvHpi6ZtLwiTJ3pHkVEaFvVubE4+henF6bRr4KjhljQT
	3yon1IlIuZ32OesQpnFbBZ26pbFpP1xEjC06vjC6+oKPbXBFXq3H4SN+W4h6jA==
X-Gm-Gg: ATEYQzw5QMn2jWg5d+6qmjIJiTZnj6gbW48CjabO44aTYpnJ8Z+fuwYcLa0qcoFLhHK
	JR+BOKO7RCH0w1/Rbanhhj49vuNDlYA3+lgi0/rCLByxRS7LDdGqbWq30XYPpDLD9XSw3N6Ltpk
	tfGNkyiyNbp7RiPaAy33ehn1MA3ykEgW5zi0JBgez8w4dPe7PesFPoS5LiLaGLNV8N+e9dRbpe9
	40NXb4+dmbqzjpq2WMWaRhGUiL5g1nWazHTmEZo6vSIHQy7xo1nEy4ri0SY0v4RADIVcqCrXuSI
	C1mdy1YAH7qDZzibJfY/FpbK65tb5MtZ7rDHbBKTAjLVHIc1tl2XcG9undeGt+fY6/349AxEMFZ
	2/2t3oFgsdFogWLmbPj79emcOqHwlP2+pVsEkwrW/TXQQEaOGFkO0xPvYIBBvrij5LAb80UlMrs
	GkzUbMw30gK/tsi1AFZJ6S4cjI/mXhLtRFxHIJmtjgIdBWfZlBQlm3EvrIc6r1ylJ3Cu2IB56Db
	1K2xOHG4s45/o0sOA==
X-Received: by 2002:a05:6a00:88f:b0:823:1c83:e4cb with SMTP id d2e1a72fcca58-829a30d70c8mr3467800b3a.62.1772851819244;
        Fri, 06 Mar 2026 18:50:19 -0800 (PST)
Received: from localhost.localdomain ([2001:ee0:8207:3134:c1c0:ef7d:b1c8:1597])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a465b702sm3134244b3a.20.2026.03.06.18.50.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Mar 2026 18:50:18 -0800 (PST)
From: phucduc.bui@gmail.com
To: krzk@kernel.org
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
	robh@kernel.org,
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v2 3/3] input: touchscreen: st1232: add system wakeup support
Date: Sat,  7 Mar 2026 09:50:12 +0700
Message-Id: <20260307025012.1539-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <ff7a9a31-2dfb-4588-83bd-1a3aa7809972@kernel.org>
References: <ff7a9a31-2dfb-4588-83bd-1a3aa7809972@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1798F229ADA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,glider.be,wolfvision.net,labundy.com,sang-engineering.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-28991-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Krzysztof,

> > +	dev_info(dev, "st1232: suspend called\n");
> > +	dev_info(dev, "st1232: irq=%d wakeup=%d\n", client->irq, 
> device_may_wakeup(dev));
> 
> No, there is no need to add success messages.
> 
> >  
> > -	if (!device_may_wakeup(&client->dev))
> > +	if (device_may_wakeup(dev)) {
> > +		ret = enable_irq_wake(client->irq);
> > +		dev_info(dev, "st1232: Supend use wakeup\n");
> > +		dev_info(dev, "enable_irq_wake ret=%d\n", ret);
> 
> Drop both
>  
> 
> > +	} else {
> > +		dev_info(dev, "st1232: Suspend Don't use wakeup\n");
> 
> Drop

My apologies. You are absolutely right. I realized these debug messages 
were unnecessary and already removed them in the v3 I sent (though I 
unfortunately messed up the threading for that version). 
I will ensure they stay removed in v4, which will be sent as a fresh 
thread.

Best regards,
Phuc

