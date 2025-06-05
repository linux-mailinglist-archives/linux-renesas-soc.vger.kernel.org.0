Return-Path: <linux-renesas-soc+bounces-17857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E896ACE8C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 05:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC49517358A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 03:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8681F8724;
	Thu,  5 Jun 2025 03:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="GUoaivs9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54EC1F30B2
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Jun 2025 03:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095991; cv=none; b=GwWiB12GYQOQyaiAvTdoLarRaBWxoV07rZFOc/9Y45aXi/LsidLV+KzVnXQeUF6Qzv0iaqs5E+nuCu2DEwqVa/jIS62EMzRS35FF+jk0vix1YIeAxjgk0lQcpHQaT98zLyqMCxI9ZDt7ORrWsxeCkCJhkELQb/uoRwHxEOuJih8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095991; c=relaxed/simple;
	bh=a99DJB7kgqKr/Mq3XFCGHLdwCFggirioNhGpFPuOmrc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DqLhFsJmxBbZ8XQW+qd9fvumzTCicsW2PoSMTvtTTuAZ7zDQxR+3fGFGPan03dzUaExOFJ1Xf05Sr3j6WcKCwIJcA/RdzcK7Z5Vih9MDBsYm2Gg+zzC3QKMNbUCraRknyfFtpYG8YX63SM3GiOqAwMWhRJr7pvwlUPW811Io5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=GUoaivs9; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so436875a91.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Jun 2025 20:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749095988; x=1749700788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzkZstCCrPCWPsZ455Qf8TsSyXtheVsZkxKhV0y9aO4=;
        b=GUoaivs9kiZYpzwlYhipgAbl+2mUua5o1Bx68wK1PfOd7ujianyReMF6esYRs6UyXt
         phfbKOWiKiJhJv8eSneKtwh3fKAp9wC1yvo6Ir75cnqWk8X9mAuwNVNRiLfaiOeGOa9E
         yxPB/z9q25hVBcHrvcU8LoiTU0jKlr8ICGkeDKnjWTp+pH1gM0yiBadJqPVRrzYK6jzB
         DYACxj+sGvOME5fED7QuIO+sCrLppUd5IphfwgazXz24kJeHJh0JrWv/aGdIpcApsFl9
         2oYLknrAwLI5kbrEM2LXOJowH3zFNl5wzw85fqMN6TxJquLmS3WXBUGHGg4FUuKHQsgX
         Mh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749095988; x=1749700788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzkZstCCrPCWPsZ455Qf8TsSyXtheVsZkxKhV0y9aO4=;
        b=SbzBxr0/AsbTFvtnH5E2vlZjaZdoeySs8gaMZijxvKeo3RrlUW5rxYmGoqZr0PtkiG
         geNhTzWGsb+cAwuIOY8THFoFVokbrCakBa7ByotTgbBtX9Cy70fnfXpcpSRxEVVPzH4/
         2JcI4+XbyUgOBafg0LkWDKXDpTyMtHmPcYa1MRbxX5C2pMaA/7I1WuOlpuk1VGfQlST+
         9g8qIOp3qIqeGidyWxUoVN2JmsuI6Hd0V/1iK0C52cu0WCZAip7cLU+tpdtS/uOnlujp
         Hy/i6S1+1F7W8CvsYCY37MV36dgvV8wx9GVisYJ/2M2dNwDASCEm8BHnQvuRNnp59dbj
         veMg==
X-Forwarded-Encrypted: i=1; AJvYcCWP5AT/6+2G5vA038kgKWN58WAqli1y6N0B1i05LJXm58QgcmUZeJwiyBg2lX9gsGwFlnh3TLB70PVX7A9FnReHRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIV7Qw2hBi+HgsdjdUy6eMdtgl7E5FOyWrsjCztOy9ViCtiSBi
	VCP/2L/FxcrXklEGT8vTuLPdbo6zeowqVPI93UeyOCniE27Jo6i8O5pPmH6cftPBRcA=
X-Gm-Gg: ASbGnctK549O40rGJ5P+SyX+Tzwyo500/AwRxUj3kr+O2Ldhau7tsHCZgDqjGnby0D9
	4TBdM41WsevbeFmiuo33mHb3pjXeOmh7jNq8pqjzJwrXyf8XfUicpWic0DvqbkDRiPkO7264Z2o
	bWTnoLEf+2FUGMfwlHRwxjOnnxnMAaplW17YMgWy+h13z1pB3ZdIgwV4wZvFbfpTGHVFHjPVoLU
	I8pwop7YZjHWAijlcyCKZfPeU9neov1ZIafQuGwuCtMVz9PdsprwxPsiWJGUfEXH4kg8AfQEcpP
	K0AHkYCfXd5AIAG8zp1ZlCO2zfz8WVL92DHMVtcdCIEjszIs+SyEhGJ4iAi91peM7NOjocpJ
X-Google-Smtp-Source: AGHT+IHwOv1nfgRYxTOZRYlHLTPEDAVKxSayaPRlTfw7ratzj7blGucqQmZiYitkUOV/1EwZKzf8Ew==
X-Received: by 2002:a17:90b:55c8:b0:313:287e:f1e8 with SMTP id 98e67ed59e1d1-313287ef202mr2764388a91.8.1749095987904;
        Wed, 04 Jun 2025 20:59:47 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132bff66d1sm495400a91.7.2025.06.04.20.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 20:59:47 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: krzk@kernel.org
Cc: chiang.brian@inventec.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/isl68137) Add support for RAA229621
Date: Thu,  5 Jun 2025 11:52:33 +0800
Message-Id: <20250605035233.3394026-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602-elated-aspiring-squid-d27ee4@kuoka>
References: <20250602-elated-aspiring-squid-d27ee4@kuoka>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Jun 02, 2025 at 07:55:37PM GMT, Krzysztof Kozlowski wrote:
> 
> On Mon, Jun 02, 2025 at 01:04:15PM GMT, Chiang Brian wrote:
> > The RAA229621 is a digital dual output multiphase
> > (X+Y <= 8) PWM controller designed to be compliant
> > with AMD SVI3 specifications, targeting
> > VDDCR_CPU and VDDCR_SOC rails.
> > Add support for it to the isl68137 driver.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

I'll wrap the commit message body at 75 columns.
Thanks for the pointing out.

> > 
> > this patch depends on patch:
> > dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support
> 
> No, it does not, please drop this sentence.
> 

I'll remove the incorrect sentence as well.
Thank you for the patient reviewing.

Best regards,
Brian Chiang

