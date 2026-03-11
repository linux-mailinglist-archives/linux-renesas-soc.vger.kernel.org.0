Return-Path: <linux-renesas-soc+bounces-29200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDfSGOdxsWlVvAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 14:45:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C058F264C61
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 14:45:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C7BB3016906
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 13:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1729331ED7C;
	Wed, 11 Mar 2026 13:40:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85529258EC2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236449; cv=none; b=g5sIWE1e5+BDGC8AmN4X7VAwS7YU3xCY8V8M3yosLP7C5ZJzJ3SHtgAy9Zd0nWTYmMVb6+LK2WFUOBMf4l1IwF3Vngvgf+ff6EHUr433lmAiYtVo60EKPqVMXOjcTWbIxQKj6HBabwo9egC/fXXJEsIneqbemfct9MM5Msxs4pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236449; c=relaxed/simple;
	bh=5xYUudxznhB/9gI0iYC0XCpk27j9+cjg1Iajg5XCHoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rX1+v1/1Sld2qyupIIT3yMdXfgFCvJJ/wQs2pIrQwBk2XndN6CBj0dX4d8kFjw966LrvRCNe69c4mpBZwh197bh3cTy8LL5hLWdgao8QwgRqrV8J6MX1pyKZKXc2StaIoz4NcgJN12p0SnsSGVc05L5xtK92A/C4xilMzpcmRsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ffe6887e29so2809797137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 06:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773236446; x=1773841246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cArsbpNTjSz4s4xSJeS/zGPEDFrbSvYY3oJhygDvULo=;
        b=OyknqZGjACcdiiiyovkmvsigFBXuDX4MtkMKF+5f5NN+92w2q9V8v89+K55HvEK01j
         D8LULidawLnH8+Pfm7rAyRWf9HyC0ZABSKjzIWiPhpToRRv7KswZECoNYzWPsd2i64zq
         Wm+IEUZvHetFbKEo3lb0VvqBUU2zOSutULE40DRt4FofRgkBJHZTI98GYwT5iNbtVUTu
         NTqfgvMlyZ6QUJoBpE4U2OkbCoIt/Ihfv+qjLY/01E/c8K0R75MV+cCEhfbkgie7+UjJ
         AvHwnwJ/d8+Ilk5joRdT4nKJCtLQHB8TMPdJWGDjkUj6QRH5CXKj6lPPSnA9IYwA4zaH
         3lGg==
X-Forwarded-Encrypted: i=1; AJvYcCXbkwI8K/0p02aiLh9+ZXm6FJFeRi8t6xvLXgyi7o5vSBSXBlGkcDuvDd4W2bo0Y6UUAT0wDbPh/NmVWIqAR6usDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrIgGpAppRfF8+4Bk6D7+d5Ngf+lcs+bPA4XanUCUDgbTo+Hw3
	pmdgzscedQNcOvBuq4z0/GmMX+suaMnE1isBFZ1sb+MD42VxYNWyif9B2WiwfgSJ
X-Gm-Gg: ATEYQzwDc2ah9+wS6/xY9S4PMCP33RaNUFYo4KLH8pOXBNAXZBNZMytvTmZ7PGWACts
	HYSPmrDaBi6qgahsnrHdI4kgK0wn3pXXHO+9SoOPE3W+cq+ESzSWfBh7kicw77smB3PsQbt2gLM
	DmGNrXRqHlrUue2ZUheQiv7EefxjXSLpX1Ch3p/O9dQKidIyWZh38g5idyBfaWCj0qNQGe6a/oa
	/A5men+S8YjX5xIBY25rCL6CLCMk7uhwJ02Dpx5opL31xsEnGA2JovZZFXowqs/hsRiUWGuSEHe
	PLI4JS3d5gfQeMJfZFfESN8Bgb+HS2+GQV7Ns6wPl3kWDaWonks7GemzuCEy8mt358Wi28TURBr
	G4mNHCp3/jiAOWZ6XkLdCKwdwdoUGtNYtmzglBGxf2m+bzMjbiZMIqpMFcFQRIwrVGPS7P1yEJ7
	CxzXRvvSYxdai31lVJitqLyPZwCAjTar9Op5xEwIsu2RNet4U5tdIBz0Vi9hwHCwKVlxTVmL4=
X-Received: by 2002:a05:6102:d86:b0:5fe:f14:e701 with SMTP id ada2fe7eead31-601def4d596mr1003386137.24.1773236446424;
        Wed, 11 Mar 2026 06:40:46 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecf9f94e4sm589775241.0.2026.03.11.06.40.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:40:45 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ffabb1dfbaso4381867137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 06:40:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2KFNCYsv43xPUvO+1DIUFbmgTwVZVb5Dr13Us3JG9snyEGBa3Pi89t9y511TDTV4Ul82IKl1dIC53ayGoJD6dzQ==@vger.kernel.org
X-Received: by 2002:a05:6102:162c:b0:5f5:2e63:f574 with SMTP id
 ada2fe7eead31-601defb72a6mr1104622137.29.1773236445414; Wed, 11 Mar 2026
 06:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205-schneider-6-19-rc1-qspi-v5-0-843632b3c674@bootlin.com> <20260205-schneider-6-19-rc1-qspi-v5-4-843632b3c674@bootlin.com>
In-Reply-To: <20260205-schneider-6-19-rc1-qspi-v5-4-843632b3c674@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:40:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcwnYyN56Ktee0wR=oT3oMoZ=5KD=5RF4Bq2ohueJNiQ@mail.gmail.com>
X-Gm-Features: AaiRm509ZGDpwutdpDixUlMdHUAqZXZJALvV2NTJJn7lmkLWEJoaky0AqQwCh4s
Message-ID: <CAMuHMdVcwnYyN56Ktee0wR=oT3oMoZ=5KD=5RF4Bq2ohueJNiQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] ARM: dts: r9a06g032: Describe the QSPI controller
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Santhosh Kumar K <s-k6@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C058F264C61
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,ti.com,bootlin.com,sang-engineering.com,se.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-29200-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]
X-Rspamd-Action: no action

On Thu, 5 Feb 2026 at 19:10, Miquel Raynal (Schneider Electric)
<miquel.raynal@bootlin.com> wrote:
> Add a node describing the QSPI controller.
> There are 2 clocks feeding this controller:
> - one for the reference clock
> - one that feeds both the ahb and the apb interfaces
> As the binding expect either the ref clock, or all three (ref, ahb and
> apb) clocks, it makes sense to provide the same clock twice.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Thanks, will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

