Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B32D515107D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2020 20:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgBCTtm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Feb 2020 14:49:42 -0500
Received: from mail-lf1-f45.google.com ([209.85.167.45]:33002 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgBCTtm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Feb 2020 14:49:42 -0500
Received: by mail-lf1-f45.google.com with SMTP id n25so10610211lfl.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Feb 2020 11:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GJW3MqlE5owbDhtpqwCENMXF7s9lIFDdl8Yc5jDiRR4=;
        b=ig1YxkrY/GCTRIwu7ZXNWdgCqi6CskjV1klqHXmcddnhd1XYKAkVw1zpmr5J9JKW2p
         RacBY3R+tTbq4JL+F+91IDfZX+zdyL6X33FmsLzdMZHU15Tf/pSce6BGEn3vaKSGX7BU
         v9e2RDKwL5rRpFYm9mhJnayY6spM+sJ8ovkbfCbO3eA1DXdLzoVMouVXDr7MJUoJj89d
         pjSKH5e/bt3QvQfkblZWyKbJO+Wda5VRwOy1lMWv/sfCZVPJR8dqpXKsBmGii4ixCDsP
         Jb7DZRg03MQKF8aEtNNfDaC3hufv6j/veDcMkCC+egs3AvOCe1Lwls1K8LzpSE2WpYLv
         QCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GJW3MqlE5owbDhtpqwCENMXF7s9lIFDdl8Yc5jDiRR4=;
        b=ahvBZSBz8hzusanAymBiUyqFC6Ntynahmj0qyPmeP0k66fz+BWLTjcE071w2HASmIn
         qC4In/olnUsJbYTBnZN2IGaU0/alm/W5uNdNA4dc170E3xPDMIAckHowNBraSwoEciTj
         7vHZCX9Y1l0FwdH+YxjYq4GuY9ZOkGkYfPqwGg3h8sWiMOCNIdscmHbOQzDJAEU0aIqc
         GmsUAVu1fFRYB2333RFOoKO6398NtPROcLNsf5ooYKZwVDfzpdhcGJ7RygQ0wiWSL7ZT
         GSUDhri09NxjoGXqtFFfJ8mXC97EMRPerR2urANNhyssys/AWmCk/ZszmxR4MtF0oMzq
         3iug==
X-Gm-Message-State: APjAAAWhD9fEZd3poNCoBcaXIRNxQYDZb9qnCBBkpIYRGPFjYIjx8fbD
        n//6sVowRQsvaszyrjLH+Fb4oNJ4rXM=
X-Google-Smtp-Source: APXvYqyQX7zRSlXWr0in9WYbFOsp8LDgWp5f/v4lbz5ZmNjymhf4xmSs8Szvk9cqn2ti0cQSjpn4Lg==
X-Received: by 2002:a19:c3ce:: with SMTP id t197mr12730465lff.174.1580759378258;
        Mon, 03 Feb 2020 11:49:38 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:466f:add8:5793:bc04:7360:f621])
        by smtp.gmail.com with ESMTPSA id k23sm10439035ljj.85.2020.02.03.11.49.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2020 11:49:37 -0800 (PST)
Subject: [PATCH RFT 4/5] sh_eth: add sh_eth_cpu_data::gecmr flag
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org
Cc:     Chris Brandt <chris.brandt@renesas.com>
References: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <bea798e8-c1dc-1170-a8af-6e3749714651@cogentembedded.com>
Date:   Mon, 3 Feb 2020 22:49:36 +0300
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

Not all Ether controllers having the Gigabit register layout have GECMR --
RZ/A1 (AKA R7S72100) actually has the same layout but no Gigabit speed
support and hence no GECMR. In the past, the new register map table was
added for this SoC, now I think we should have used the existing Gigabit
table with the differences (such as GECMR) covered by the mere flags in
the 'struct sh_eth_cpu_data'. Add such flag for GECMR -- and then we can
get rid of the R7S72100 specific layout in the next patch...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   14 +++++++++++++-
 drivers/net/ethernet/renesas/sh_eth.h |    1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -569,6 +569,9 @@ static void sh_eth_set_rate_gether(struc
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
 
+	if (WARN_ON(!mdp->cd->gecmr))
+		return;
+
 	switch (mdp->speed) {
 	case 10: /* 10BASE */
 		sh_eth_write(ndev, GECMR_10, GECMR);
@@ -663,6 +666,7 @@ static struct sh_eth_cpu_data r8a7740_da
 	.apr		= 1,
 	.mpr		= 1,
 	.tpauser	= 1,
+	.gecmr		= 1,
 	.bculr		= 1,
 	.hw_swap	= 1,
 	.rpadir		= 1,
@@ -788,6 +792,7 @@ static struct sh_eth_cpu_data r8a77980_d
 	.apr		= 1,
 	.mpr		= 1,
 	.tpauser	= 1,
+	.gecmr		= 1,
 	.bculr		= 1,
 	.hw_swap	= 1,
 	.nbst		= 1,
@@ -957,6 +962,9 @@ static void sh_eth_set_rate_giga(struct
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
 
+	if (WARN_ON(!mdp->cd->gecmr))
+		return;
+
 	switch (mdp->speed) {
 	case 10: /* 10BASE */
 		sh_eth_write(ndev, 0x00000000, GECMR);
@@ -1002,6 +1010,7 @@ static struct sh_eth_cpu_data sh7757_dat
 	.apr		= 1,
 	.mpr		= 1,
 	.tpauser	= 1,
+	.gecmr		= 1,
 	.bculr		= 1,
 	.hw_swap	= 1,
 	.rpadir		= 1,
@@ -1042,6 +1051,7 @@ static struct sh_eth_cpu_data sh7734_dat
 	.apr		= 1,
 	.mpr		= 1,
 	.tpauser	= 1,
+	.gecmr		= 1,
 	.bculr		= 1,
 	.hw_swap	= 1,
 	.no_trimd	= 1,
@@ -1083,6 +1093,7 @@ static struct sh_eth_cpu_data sh7763_dat
 	.apr		= 1,
 	.mpr		= 1,
 	.tpauser	= 1,
+	.gecmr		= 1,
 	.bculr		= 1,
 	.hw_swap	= 1,
 	.no_trimd	= 1,
@@ -2181,7 +2192,8 @@ static size_t __sh_eth_get_regs(struct n
 	if (cd->tpauser)
 		add_reg(TPAUSER);
 	add_reg(TPAUSECR);
-	add_reg(GECMR);
+	if (cd->gecmr)
+		add_reg(GECMR);
 	if (cd->bculr)
 		add_reg(BCULR);
 	add_reg(MAHR);
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -490,6 +490,7 @@ struct sh_eth_cpu_data {
 	unsigned apr:1;		/* EtherC has APR */
 	unsigned mpr:1;		/* EtherC has MPR */
 	unsigned tpauser:1;	/* EtherC has TPAUSER */
+	unsigned gecmr:1;	/* EtherC has GECMR */
 	unsigned bculr:1;	/* EtherC has BCULR */
 	unsigned tsu:1;		/* EtherC has TSU */
 	unsigned hw_swap:1;	/* E-DMAC has DE bit in EDMR */
