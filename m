Return-Path: <linux-renesas-soc+bounces-29171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FdnKyTusGkaowIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 05:23:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 115BF25BF01
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 05:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C69E83064E8E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 04:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EB42C11EE;
	Wed, 11 Mar 2026 04:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DX7+ggyd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429E223EAB2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 04:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773202977; cv=none; b=IhPj1Ojic8/9uLxQz9cRay8IYy7oD4SziAxXklfWvqcnSuqQmS4qzxhy9RaF91pkf43slW6makQjNmeBnR5u9C11VhdICWnYAeoPKf2/KDvQAVUuaA82agu7ec81dEBlhC8JlbxegaZ9MobWqP5QP6zyOJ+FF50rNAAKNg03NmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773202977; c=relaxed/simple;
	bh=mBbE/zKBLrYn8rujMkLRaCpcpIa4S8HOBGzlFgBZKaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cSotwxRbG7br2dVgpNeBquf8ERSfoZfhL0FPz9RfI8s8Gj3LT0YSG/dzlRmBsooQJHxvcj+uOKD8sdnnpIWAqBm824fOGbZUo1U4aCeaDZa/MeaCOF1J7kWJX6Ykf8TtjizTkPF3LvhIHlxinXfmjj8LKDLsQ9iDZ+QYk7KpQmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DX7+ggyd; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3598df39444so6522103a91.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 21:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773202976; x=1773807776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBbE/zKBLrYn8rujMkLRaCpcpIa4S8HOBGzlFgBZKaA=;
        b=DX7+ggydU2OtpbcszMQPoJqAOK8nu/gHfnYMQUEUftkjpk2HvK4p5qxLRHHHPz1J0y
         2I60PMXTAgGXoQQgcggz5G8Nx8mb2XfS1C6Ib84LxdJ2LLoCBSMJn0jsmgzOi/lVS7a1
         8fstk0rFrGsQHJtv1yjaXVK+VwOD9KJiCCgkFvW+Xki6Iw+nRJnUDKveiIjDlJl8mh2X
         JEMaTqS/mj+xCMRyaBIxjWH5eNP5cZyWOzOTHzDNToGnOJUK3hiGGQkMeNQaOt6cwrzC
         ckL5q6DgUx4wuO9lK2igCWiVga6kC3mlXFvXlE03ZyhJTiIr1h/xY85fHLTgUuTcWwth
         K9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773202976; x=1773807776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mBbE/zKBLrYn8rujMkLRaCpcpIa4S8HOBGzlFgBZKaA=;
        b=DbSVv9O9OwmiywmOclDn0nh7qvL7K9yYpVsR6wbNRouflhQpWYMW0sVC36EgihXZ1E
         8ojSi65cbiuNJTXNhFXqq0YpJQTs6568OFMOrbQSoOLGi7XgRleSuUPvYZZXIm/5lD+Z
         A3EfwI56IgN6Zvi1apgzNiQ8cnjfzB/kF7OE8Px80atUGRgmtrRGhGDlgfzKLKoYd/NR
         KGxIu38q9aGaPsehBeM6AHr/7F6NrVAYIDlRq8LFqdUu/U68CbHhZt0o5BZxkOAKHfNr
         u02VOwPhft6vKueGcA30lIajT2vGLkBaxo01hUY730iMMDhhBITTcSAkfzk+c84iWcHW
         gJhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXCFVzyQOqrn5a+SawK7gmdP83ZVjdZSqD/Si7NPv0a6VLPYrmahfCDiSihbt71clYK5KLTO/qBtNz3k3cBabQzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYMFG2m5h4uhlvkSbJHezYbJoSpx3IINz8BNvA8fn+1PYG4Dmg
	I30fZTcIa/g6Vd9wOGIw+u+3t4LjCgTBSBvvOVu8gZpUkCRwUzBUJcHo
X-Gm-Gg: ATEYQzyJKc9SeAmWQPYjzZRI5dMtkxwFFNWLiJ8OvWcw8hkppDPleZVqZSiB7RtOFY3
	oGB+2ExipCoggemw3Ll0RutRro58hN07FjjfP1FZ+JvKmuzj7q3N4D+XAlyzydzYSFp9JOFrXfr
	OV+7x1QqH+TyQ/GGRVIQUZC96AUR7AH2jjChfvr4Yc02Fj2WWvUOaBgiPMv8FlCMOTCgE1Y2lFr
	9OhEm1N5yiTtAzLmlYpsSojCbZfRi/VZY0lxAeQlPiUI2IM/SRp916OYg11y5zqoLYz2Aed2aAP
	SqjRTkW+BonSDA6uI/QPCLhpYH17lkqwev7Y/qtHxhsZ1r0mQfuQV1kCjBrhfYRX/S6AjxYNJk3
	JRSNjC7UA5FS0cJA8fpy/XaUAudqd4kY/GPbVrf+5TB2SsfbouQxqmcV7am53vhMlppUJEKRLPV
	tSsmYxoigxnGVz4FKa4Kz2Uv8BYVkj4Y70nq3scLMUzqHaIEyzR+AAnHc24pUyTf1Twn+AsRA4o
	4OcBnDhIdQdIqwKV8vEWw==
X-Received: by 2002:a17:90b:3d0f:b0:359:b7a5:21a8 with SMTP id 98e67ed59e1d1-35a011d3905mr1172850a91.5.1773202975638;
        Tue, 10 Mar 2026 21:22:55 -0700 (PDT)
Received: from localhost.localdomain ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359fe40bed5sm1241924a91.5.2026.03.10.21.22.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Mar 2026 21:22:55 -0700 (PDT)
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
	krzk@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	phucduc.bui@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH v4 2/2] arm: dts: renesas: r8a7740-armadillo800eva: 
Date: Wed, 11 Mar 2026 11:22:49 +0700
Message-Id: <20260311042249.2380-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <abCkX_oyqaa9jM5F@shikoro>
References: <abCkX_oyqaa9jM5F@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 115BF25BF01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,glider.be,wolfvision.net,labundy.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29171-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Wolfram,

Thank you for your review.

Best regards,
Phuc

