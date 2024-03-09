Return-Path: <linux-renesas-soc+bounces-3643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DD687720A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 16:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 457841C20C4D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 15:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A07445955;
	Sat,  9 Mar 2024 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qgDt62PG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AD54503F
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Mar 2024 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709999703; cv=none; b=lmklL588naOIBsaLpMk+TKZa93XajIh9CW7nvkg4r8EXz+GO9k9Aq4Pqz9sAcwihZQxynRRMZEWdMIMp+Rl/GalD5523d6IqUzxN/xH2WAFRSu77w41Vqau3UKEiG3vTyoUEHQpaB5JjzDL6/r9ZWmdyztqXlUslyNpUOeeZtho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709999703; c=relaxed/simple;
	bh=okntOCxHdXfDiSNGp5Q/yJnmIT//bZkGzzyQ8XGTaX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HIp3Elh45cSXf2H8hsOkEcgTENN+NuCTmze1skhQOIOhgYXFz1HheCWMotiv14RxKfuaAHBKazZulQ/0W/+sqTF50TJt3NnNHnB8J8dKlpFUErUMCKKOjhAe3RsIFkAwl2b8EtRNdUTmiurePFP8vUS5AgOTZLdo2jLOeVMTScU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qgDt62PG; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a44cdb2d3a6so433904566b.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Mar 2024 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709999699; x=1710604499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TuPstnhPbF0+SqOFtEx4l3f770SiiyBvVtP9fLpE7xM=;
        b=qgDt62PG92EcX5ByZgywORYj/mtAYFh42in+kzB+UY53NXrfMZzqdB+SM2gTlL1wZT
         Fw7InVEatjH8sEXicUb6byNZ3f0q4emoQllkRkHiPjeojA7j3VLMFcdBysrCBeFuppqA
         BA3irOkQL7OvDy/w/NAVCGBy2Oy1xwgk8JsTudKkGdGKNZTfH1ttw+bUkqMk9rbqxTXb
         GIccof5v2g1afIvEJgR0MJg3VDZH9D+UNYBHQGEMMQocDVMChjfKExjdNAL01wGso+7V
         LbYqa6hv/Tp4eHSKlbeYyu1vyqYMQcBJlOJpJQuJOkNqaXj+j2AgBE9bxKC0zQSrtuH4
         gTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709999699; x=1710604499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TuPstnhPbF0+SqOFtEx4l3f770SiiyBvVtP9fLpE7xM=;
        b=sUGfbc9kXIhjFIB4omGPmM2GHSa84ZoxyQVkizuxy1dLdLfj2NOBapYxX6nzAZxwn8
         JWWj4n64EsnjSlkqFXAu5YJ7soyz28ZCqijm1V6ku3em0LmCXmF5yE9On3AtiFN46JOI
         zAu19ttw9ZdT7Y8Ys1Lckx753P0sVbAPywILyHGfQHQk32vyloT6DrftF//vwRajdnqf
         IP7vqZLPOsMpM3F/VWlFeQayTJP09VdQluvMh/C/XzQ4l4e8d4wDUe3QEMkR+OeDFdim
         iWqrG2JcArhDqvkAWNWk01s3ldEG2DalRagJgBXOIdXir8PhjwL3J5MeWLi7vMTk5mo0
         iRRQ==
X-Gm-Message-State: AOJu0Ywu3is5BL+en8Z1gZPYt8bg+CbvzF1P1jxrzDLMvUFiGuuEDNZv
	17YCYSt6ynPAkQuOscF2R0AwgxqJcj3lgFGRerBkZR4rsx4t6bXMUnvf6Rk3III=
X-Google-Smtp-Source: AGHT+IGbh6WubsmxB+EyIWgSpXzWgufzyOMSGt456adwbXwfz1//V8NkFP/YttWdi1xXc6jyRIfsHA==
X-Received: by 2002:a17:906:1d50:b0:a45:f94d:db4b with SMTP id o16-20020a1709061d5000b00a45f94ddb4bmr1215620ejh.35.1709999698940;
        Sat, 09 Mar 2024 07:54:58 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id kq17-20020a170906abd100b00a40f7ed6cb9sm1005216ejb.4.2024.03.09.07.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 07:54:58 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 0/2] ravb: Support describing the MDIO bus
Date: Sat,  9 Mar 2024 16:53:32 +0100
Message-ID: <20240309155334.1310262-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series adds support to the binding and driver of the Renesas 
Ethernet AVB to described the MDIO bus. Currently the driver uses the OF 
node of the device itself when registering the MDIO bus. This forces any 
MDIO bus properties the MDIO core should react on to be set on the 
device OF node. This is confusing and non of the MDIO bus properties are 
described in the Ethernet AVB bindings.

Patch 1/2 extends the bindings with an optional mdio child-node to the 
device that can be used to contain the MDIO bus settings. While patch 
2/2 changes the driver to use this node (if present) when registering 
the MDIO bus.

If the new optional mdio child-node is not present the driver fallback
to the old behavior and uses the device OF node like before. This change 
is fully backward compatible with existing usage of the bindings.

Niklas Söderlunn (2):
  dt-bindings: net: renesas,etheravb: Add optional MDIO bus node
  ravb: Add support for an optional MDIO mode

 .../bindings/net/renesas,etheravb.yaml          |  4 ++++
 drivers/net/ethernet/renesas/ravb_main.c        | 17 +++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.44.0


