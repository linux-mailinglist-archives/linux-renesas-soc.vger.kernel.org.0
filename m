Return-Path: <linux-renesas-soc+bounces-28337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJB9E1ivl2nO5QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 01:48:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D47B5164005
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 01:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2021530B3093
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 00:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED8321ABB1;
	Fri, 20 Feb 2026 00:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V99lUJsk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACD6207A32
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 00:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771548245; cv=none; b=iBxYfEIISLXIYP8Y8bgLuEFPXXCboxU9/FAcpV09e6hQfoXRXPQVm1Tmi/dINIDfoiVcEwHJ1UxBbJCRxUaSIbd3yLzwOATSl5zYVU+jVqce/ZGIc3bhwKDKX2EkNPOzPVJCajp9fDlvoheQ/RfsmnIni6xkso8taanJIak02M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771548245; c=relaxed/simple;
	bh=BDTw+eDfdE7M+/+F6uei5ntF2At6yGsAeLZmalhgCMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rB6dZHYBR7YFcT0EFwcVQ5NHDRE6sWDyGe8RpwtT4FnLAED2XwXkClfRv3w8Loq4AttYGBmMoe2It7HQbGmCBDEOOzbKO2PtP5OBIR9QWsPGQsMrGIe1zrcZ3caQ6y5RG+G01+t+KOArqvsb9F4UKQSYkQ37fSs+h1eoBpLLN7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V99lUJsk; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-824a3509a12so885393b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Feb 2026 16:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771548243; x=1772153043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8Swd7ImjQhdLe4zf/a8DbqXYw6m4TT3gQEggQly90A=;
        b=V99lUJskYWRAl+jvMTTTaUdoTiMLfugcMEnmLBT+CuC+aclQi/E1f5zZ2wYP+aqDET
         SjUHG6vBSEGzC23JB2SgjoWX1LQRSuLOB5jm0QEeI0AIavINU2Nk9ux6S7nYQtlTcEJF
         1FO9soZhKk+QWCDN4jVJhGqZqVUvJwRwPnaVkBRNGg+j0N2Vce1ypwmrwBY0YKRLdJpU
         itgcdcOWycN0AlgE8eyIUp/8FDYE/E+9FG5IyrRZXMh0Y46Wi5v+BN69VugLVdZTqnjC
         OzJod0OwftweCH0SAUeQRdU/FRKAtrGLg5tf6CbJ61Z8CLiciLnJOJLFMkRvUgeijYGg
         gv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771548243; x=1772153043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W8Swd7ImjQhdLe4zf/a8DbqXYw6m4TT3gQEggQly90A=;
        b=JpBqkXdFgRdJcTuDsvZdRvoSNbBiwjzT2rJ+RUxqoCjqsEZDg/ORu8K44q01Sf9kCM
         g/UyBG/DkMzn6Gdh1mTdEIzTqbINk8PH5tKbHYtoplj3UUe56iTpY9gg1RMUS8mgQndp
         kOBwYWIVugDMmZ1Qrl8QGgSNRZ9teytceEc1exZ0aHRHOUptEAQS+6oLL0B//Ay7m9Cc
         7NjYYS8ibaQdKD/iCb2ON2H/NWl75xsZJzv7sLE+ChpUyL9jGHF1iwNxJgbhP1Qj8cPe
         2FAinYftzDiCBlh0aA7pJ+X7iLEbNNBbSb1JSORSDQdZUXgoHSu701LTZbfNAAtVacOG
         uKtw==
X-Forwarded-Encrypted: i=1; AJvYcCX00HwsNdtaDfyBzpTqcv6142nzJ5o0Nlw5cfp3t6Aw4eV2Te3BHXeITn6E3OZSv2P3JewvMD5X9d7Z8Xrv97875A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVffk1ImHnRzx62k8FgIwsw0cvLtmLPPR3C72Comolou4qAkum
	AjOtPQ1PcQ6xrDbUEU7ZMze3l632mBn2QXo42sqogbZmVtP22abK9Nbs
X-Gm-Gg: AZuq6aJIrshOh3tBBGavk3/kxgOIALnynUMEXh/mPEVNKOtXRKKECHtpJPPMkpLeDvo
	xaIHowzHSUQzru3TANI/jk11XsUwajk//ytLti7VG5JmdJ4GjKrz2uBGIWq36zFktHzr5Zx+kJ6
	ncGykPjUpW6FkjY7xottO0W/Mgs7PEp2eXaHjFT86Rn8QxP1e4+spJi6XD9C/TAx0dujNlw+Jlu
	54IfTYfUB8/5uW/TVdzZAyUtyeO5pWNvae4QgZTjM33G671bhZWOmO53Iub5dbOXTbp32R9l8g2
	RFbgl2wqfgSw8sDco9xrV12Kmo77f3CrfzYaFdsg0I4HbITsIhZ5o1G7bNSYn3gaKFJshkslRSh
	DFq5pBVzsq+RHs+s2xc2ynsQc3+ZMFBvuRRRlEuwOduargMoGRvZeF/ZKkiYPYVpvzhfs1+v4O+
	BNvE6DGc3FYTRbG37H3mTXvUNbFhmj40MBCIFu0m57RHv2ekwTGp9jQp8=
X-Received: by 2002:a05:6a00:3909:b0:824:9451:c1ea with SMTP id d2e1a72fcca58-82527746e8amr5298075b3a.67.1771548243229;
        Thu, 19 Feb 2026 16:44:03 -0800 (PST)
Received: from localhost.localdomain ([14.0.16.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a3e15bsm21194743b3a.19.2026.02.19.16.44.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Feb 2026 16:44:02 -0800 (PST)
From: phucduc.bui@gmail.com
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: phucduc.bui@gmail.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: r8a7740-armadillo800eva: Enable 
Date: Fri, 20 Feb 2026 07:43:57 +0700
Message-Id: <20260220004357.1680-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20260212073819.41304-1-phucduc.bui@gmail.com>
References: <20260212073819.41304-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_TO(0.00)[glider.be,gmail.com];
	TAGGED_FROM(0.00)[bounces-28337-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D47B5164005
X-Rspamd-Action: no action

Sorry for the previous HTML email.

Hi Geert, hi Magnus,

Gentle ping for this patch:
https://lore.kernel.org/all/20260212073819.41304-1-phucduc.bui@gmail.com/

Additional hardware clarification regarding SDHI1:

SDHI1 is routed through a mechanical DIP switch selecting either
the SD slot (CON8) or the AWL13 SDIO interface (CON14). Only one
device is electrically connected at a time and no runtime
reconfiguration is required.

Tested in both configurations:

SD card (CON8):
  mmc1: new high speed SDHC card
  mmcblk1: 29.7 GiB

SDIO (CON14):
  mmc1: new high speed SDIO card

So the SDHI1 host works correctly in both cases.

Please let me know if any changes are needed.

Thanks,
Bui Duc Phuc

