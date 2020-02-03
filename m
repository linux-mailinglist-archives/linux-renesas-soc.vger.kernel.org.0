Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04CCC151070
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2020 20:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgBCToe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Feb 2020 14:44:34 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46446 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgBCToe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Feb 2020 14:44:34 -0500
Received: by mail-lj1-f193.google.com with SMTP id x14so15907025ljd.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Feb 2020 11:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HnOqv52LsuS6e7VLRHuTIqexScV7tIRDDEebVoaMErk=;
        b=ttFJBYP0NxYVmNMMjJ2/beAL8Wi9ULmWzzhiri/Ucti9QXsY47wwmcAG6ay/D4jYlX
         g4hjScZKHtTU2b3+vDPn3XuKoRBvGrTlFOZhElIO7y7PJj+fDcDz+Fmis/Gfg/dLc6NC
         VsbvRE4HR7YRTe5HGQAKPrepicCwTOx4gFfdF0GgyEMFbTQFH2ejgaCPjMZv+9IxZvS6
         n853toS7TEv4ezGxkuWXgu54+Pcq2nr3DyC3338WxCB/kn3n1iJtjJg9PKNa/TMsc4q3
         px8bQhrRxvnmXs7UgDZJ8dFbS7zw2Uf/wmY/6DmdtaotJP3igowslWDIU2SIsSTSbwwY
         BoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HnOqv52LsuS6e7VLRHuTIqexScV7tIRDDEebVoaMErk=;
        b=J35AU9/5wif69zajdozdnTMeC9ZxgZOn6sEx8Pw5CUu7iRNkVVVONX8E1MKZOJ1SMB
         Toc81yZTp7AHaZuN1qRtib8usbuiFAKzj/lVBUN/1pSszDiIIfosxPx1CfEkQBYAkdJ0
         KKx77HnrX+zBSIC/FTUuruT1GyzdyhiDovaGYZDrlkv8AzK54g9rRAc2H4IWSsHH0pIH
         c7mt5lhLrMTBOWnBNwtj3em+pyIkNNMO9ITL7WIZcA2Qcl7hjqjvMyNSq9EqBweLss50
         zeE4T12A9Ulumcw8jB9ve8cI6DaTsSMH/I2Rgd8AZhfLg69IRm69iX6q35KMedFPdtdY
         b5hA==
X-Gm-Message-State: APjAAAUrxMwZh+mTx3h7EalVMTqx9pZ2UjVDrU33ZmhQ/upb3YeEGHHg
        p5TiYUxcwCPCSO1A6WCIgy9FfVibeYg=
X-Google-Smtp-Source: APXvYqx5jvEk6aKACjWO+2aPX0bvsn9rx28OwRlxhkETqjYtZNPUejSG5g1e6RXJGndNfLp4kcc3VA==
X-Received: by 2002:a2e:b4ef:: with SMTP id s15mr15509632ljm.20.1580759070878;
        Mon, 03 Feb 2020 11:44:30 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:466f:add8:5793:bc04:7360:f621])
        by smtp.gmail.com with ESMTPSA id w6sm9493727lfq.95.2020.02.03.11.44.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2020 11:44:30 -0800 (PST)
Subject: [PATCH RFT 3/5] sh_eth: check sh_eth_cpu_data::no_xdfar when dumping
 registers
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org
Cc:     Chris Brandt <chris.brandt@renesas.com>
References: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <77fcb2d3-eaa2-c6c3-be87-50b8e4a46de3@cogentembedded.com>
Date:   Mon, 3 Feb 2020 22:44:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When adding the sh_eth_cpu_data::no_xdfar flag I forgot to add the flag
check to  __sh_eth_get_regs(), causing the non-existing RDFAR/TDFAR to be
considered for dumping on the R-Car gen1/2 SoCs (the register offset check
has the final say here)...

Fixes: 4c1d45850d5 ("sh_eth: add sh_eth_cpu_data::cexcr flag")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -2140,11 +2140,13 @@ static size_t __sh_eth_get_regs(struct n
 	add_reg(EESR);
 	add_reg(EESIPR);
 	add_reg(TDLAR);
-	add_reg(TDFAR);
+	if (!cd->no_xdfar)
+		add_reg(TDFAR);
 	add_reg(TDFXR);
 	add_reg(TDFFR);
 	add_reg(RDLAR);
-	add_reg(RDFAR);
+	if (!cd->no_xdfar)
+		add_reg(RDFAR);
 	add_reg(RDFXR);
 	add_reg(RDFFR);
 	add_reg(TRSCER);
