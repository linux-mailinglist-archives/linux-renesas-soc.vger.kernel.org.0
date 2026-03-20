Return-Path: <linux-renesas-soc+bounces-30042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA1+BSTfvWk1DAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 00:58:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AACF42E2649
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 00:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 164C030240AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 23:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E193B52EE;
	Fri, 20 Mar 2026 23:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmC0PNqS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64393321A7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 23:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774051102; cv=none; b=B5EedSevN92BHp6VMQTLue8uxNQIxx7qf6XQtb/p/NKf/1t3Ntun4mj2qtVoGtHbnDnW9a/msh+QM+TRKDaytAXEHxe7kDXnNBxhCsc8jUyltEpobH61sedXhQzx8yjzXUkwOIfWoa6r3gOZBpGNXHf4gRM6qMN4PJGmDfhwEzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774051102; c=relaxed/simple;
	bh=ks57RW+en4ONWkRvCJOQSuqmXz/QxxnWhHRzvSJIgHA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=T9fOweTQZyqPfdl9m7cY5YftlZm1bT6LOrF9jdxMGJZI8dq0Afeyz60swQCBsh8TwrV0OeFWgIyztoDCsxBGSxU9mOwsL/ISGb0hMqVcYxL7Wci0X0CfrbInB+UweqqFjIzDFnIal5qXN9LceVKUKoLPxQ53o/BjeC4IPYGoTXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmC0PNqS; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-89a0d53f3d1so30535836d6.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 16:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774051087; x=1774655887; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ks57RW+en4ONWkRvCJOQSuqmXz/QxxnWhHRzvSJIgHA=;
        b=AmC0PNqSJQAXm99yCkintZnKNnxOdzF2ZCb6EQsXCp+bORSShlYA4ItIwDVQAem4Dx
         WYH9IIsKVCar03nK5RVyF3irzKWjuZONX2fzEVAPBX5JQ/OSnuPriwTc3EI1JgOrzSkr
         9f/yCDY+jyETc1ZGVPYomUhfOY8LxRSnKSxHuDSaJP0UptOutLmjHVL0SLVV6ep8NMpL
         tTj1mLoM4OBfj81Tos9nCpZJYSJvchDQYg2E0Cx1Z4E5/hdeMRgS5zkx67eTr/wXCttF
         lkRPCpV5FRlzPLFkWFRlorI7a1KQ9OqoC8Lb9QdjhkpkNkQBKaVjvW2vdXxXcP81CPpP
         CbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774051087; x=1774655887;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ks57RW+en4ONWkRvCJOQSuqmXz/QxxnWhHRzvSJIgHA=;
        b=UrV0FDqppR2Elhf5gEKWs/WTatFChpcRDMTYPjv8vPldkumtC6p1B1QC/DXUBzF0s0
         VlfyQrOFJ6l8s3dMKmJrNnhD7zbwdMUO4ZbXFSIQ6X4ftvm+Kvw6i3WVs70iLUUkdfMc
         VsdqgMFpbq2PrmdAuQPCZCgINfoDwvhwbX5vV6DqdumGXyslM5HnuJ5XG0HZu+D+/mCO
         fe0FVC+a9Rm42HcpbVgxLHzY0fbagnotOxz5jH5/OKC1SOSVvng7wXKawJepTQD/L/0E
         H0k292acDlqZEsi5DBdBamCcSlpmthlvTpOlHgiQgh+vqOVOwfjBrNDCdDu9BnYmZXHc
         Vcng==
X-Forwarded-Encrypted: i=1; AJvYcCUWUtrODV9JJ8+WiEgWXsrsoXg/acZvw2IyF77Ebzr2viEHbn9ZSni3xwrxYmEWE6RulEfXzZyTjLr+Fv0TTbgHAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzGnvVKBNVP2gWdPeC+ym5h8cuemLJx0GM2iN5odhMclzWIPnA
	lH1a5YLDpvLZNWN9oXtD3H1C9fmE96isdbfYLUdO7SxYLw3oePHpgS3U
X-Gm-Gg: ATEYQzxYj+oZC2/mlgjdkWlSaL3atbkI5eOHwzHxFvCJKLPjjVK+/yG4uMjhWApGiRk
	nUeTpoQ5xbcP5IJtP2R9AJ0DVdpFCAj15l1WV17mPWnn6LK7HK7ofvQJhwsRhERg1tAd9b+PZr8
	8fv49Y8dMHa75UX0SkRFKILEtEu7cdcPPdzNVK1J0Q50duOKsivHENTb9zAoyVpHRlaV746Ro3b
	7jCeXt/Ip2xKPjqg3C12w2NE+SNAoB2697XCbxINqjdNqNBdisIxpmMv6t/FaOwyOpjAhhi4mE9
	1Co16SbfbbxiN2+0lptR5zzj8hY+0kKUNw4LynQx6vm5CrvF0NkaQ8aRep8Vl2WuICs7LB5Ft7l
	JLa3yWA8CoHHa8R8dJLCVXDpiBcbvXX/aFpMMnYTkhIYjJ+xPD0AVDs0yOp5oS0tPGosEI/f4Q8
	wiSX+IKI6U1RyiNBxrdhu0G6W6KYPXvRx88B2atHUt8IMTb6v6qrzxaW4zdVI2czbaC3OuaRXih
	5n0ZdORfRgUDg==
X-Received: by 2002:a05:6214:21c7:b0:89c:518b:9dbd with SMTP id 6a1803df08f44-89c85a7e205mr83165526d6.46.1774051087345;
        Fri, 20 Mar 2026 16:58:07 -0700 (PDT)
Received: from localhost (c-71-194-28-115.hsd1.il.comcast.net. [71.194.28.115])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85215210sm31650716d6.2.2026.03.20.16.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 16:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 18:58:04 -0500
Message-Id: <DH80MH0YC5X4.2PMVY8O5WQJ8U@gmail.com>
Subject: Re: [Qemu-arm] [PATCH/RFC 4/5] vfio: No-IOMMU mode support
From: "Landon Clipp" <landonclipp@gmail.com>
To: "Landon Clipp" <landonclipp@gmail.com>, "Alex Williamson"
 <alex.williamson@redhat.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>
Cc: "Peter Maydell" <peter.maydell@linaro.org>, "Auger Eric"
 <eric.auger@redhat.com>, "Xiao Feng Ren" <renxiaof@linux.vnet.ibm.com>,
 "Arnd Bergmann" <arnd@arndb.de>, "Alexander Graf" <agraf@suse.de>, "Magnus
 Damm" <magnus.damm@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <linux-renesas-soc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
 <1518189456-2873-5-git-send-email-geert+renesas@glider.be>
 <20180209085024.004b6f9e@w520.home> <DH807PW5SQCW.3AA422QQRGVAH@gmail.com>
In-Reply-To: <DH807PW5SQCW.3AA422QQRGVAH@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30042-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,redhat.com,linux.vnet.ibm.com,arndb.de,suse.de,gmail.com,ideasonboard.com,sang-engineering.com,nongnu.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[landonclipp@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gnu.org:url]
X-Rspamd-Queue-Id: AACF42E2649
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I don't know whether the threading will work 8 years in the past, this is t=
he
link to the original conversation:
https://lists.gnu.org/archive/html/qemu-arm/2018-02/msg00226.html.

Landon

