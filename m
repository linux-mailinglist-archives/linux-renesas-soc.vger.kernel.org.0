Return-Path: <linux-renesas-soc+bounces-22266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89644B97E8E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 02:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65F621AE16FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 00:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC47E19D071;
	Wed, 24 Sep 2025 00:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="MH2JpObI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8A519066B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 00:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674103; cv=pass; b=McLu6eLRKVyfMoPtH6erOyMIVysCqL8fDcz8mVk30EP+UajOoYcIBDwJx2hk2MQtDPg/XcomIwrWsM+8HN56D15EJBaWediHsajiFaprLj88+X3LuSAAVcEvbthI52SBv8ppZBHkdyuR62jTQirBwZfAWCPWfohyAdKRIF0TBOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674103; c=relaxed/simple;
	bh=99C9f39eMCyxOrO7dD5XkIn4U8NvJyOQ0G7Ujt4BkhM=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=Ocria5DjHetol7O9hfI9S4wfoE/iq30Mf5TJdkHWbTK7+Dxcb5QEOPyVY9FDn3y+27SV/1Nao6ZsUnJFmwNE6X48MTtWnCKz76qYwRHb/hYzgiLZrHcNPdxv0rz69j9o8HXpAuN0xPjH4fOLU/SouWgzYsXv2VI+7BrZO7YEW7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=MH2JpObI; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
ARC-Seal: i=1; a=rsa-sha256; t=1758674101; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=PJZF0JwZjMDOYSAjJ5RPp5SXwuCYjLzZWxLSqZwGU/+m/bW8pNTj2fQAvWbtFKuwr/gScD8yONQDEkG/gPyXkEXWc1UoKm5oBD+XhDI4KlJIWxhXTiyxy20O58fn24Br89wqIsW3FNNYAZigEYoXY6pfrf5+6tmv5ZltcDY3Hd8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674101; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=99C9f39eMCyxOrO7dD5XkIn4U8NvJyOQ0G7Ujt4BkhM=; 
	b=XyBEf+fwPDkT8ZJETQ/WcwCnqMxoZwX1mrSi8PkxYdIjdyLkyn2deQDNbreJ6ad9EZuCxZlU92fQaZYdMh1ZtoCqvA9gsmr7zyVxcdgeShGQ7g5tYtIbc3UDsmijVz+TpKiWbH6Kh22rC8behSR+iTFVGjdn53pmWn3QAArHqeE=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9aaca910-98d8-11f0-8217-5254007ea3ec_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671653600517.0554598288136;
	Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=MH2JpObIF66edSPjO+EiMdCOxd6c7SCJjI+vn1k8UzP4nKB2Hz4LPmbpDF1l00boelj56mIiF4CFIYnFsKm1TSh8JoVuW95arS2LjBiohkrHxoCbSGHOFzOW1aekF3jLWrPKQp9PpU3lmU42vp7sPD2zICPa20UR34ZGYH0VjxY=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=99C9f39eMCyxOrO7dD5XkIn4U8NvJyOQ0G7Ujt4BkhM=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: linux-renesas-soc@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9aaca910-98d8-11f0-8217-5254007ea3ec.19978ffc621@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9aaca910-98d8-11f0-8217-5254007ea3ec.19978ffc621
X-JID: 2d6f.1aedd99b146bc1ac.s1.9aaca910-98d8-11f0-8217-5254007ea3ec.19978ffc621
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9aaca910-98d8-11f0-8217-5254007ea3ec.19978ffc621
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9aaca910-98d8-11f0-8217-5254007ea3ec.19978ffc621
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9aaca910-98d8-11f0-8217-5254007ea3ec.19978ffc621@zeptomail.com>
X-ZohoMailClient: External

To: linux-renesas-soc@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director

