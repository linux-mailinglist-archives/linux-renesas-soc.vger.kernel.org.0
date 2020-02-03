Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 395B2151088
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2020 20:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgBCTv0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Feb 2020 14:51:26 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33864 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgBCTv0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Feb 2020 14:51:26 -0500
Received: by mail-lf1-f68.google.com with SMTP id l18so10603290lfc.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Feb 2020 11:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OjD56YaXkaT+bUnze/IWClXeWQyNzmBoBBWle888BVo=;
        b=aNM1MUb75K9Ph78pcbQjbKKYd6NbM51uDCKQvz5VINvyxjCgeUPuUABV6X8hUTVpBk
         TEZgpMbv461lqMhUWxgKRYG+GVUzfUunzGEdOFaycsP6TfMaIa2HmilrNpEg707iUEnE
         A6to693mm9p9u/0eqh7GUY2kFjh3THoneMqX/265K1H8OLII+jhmGRUF+PXB4oabLepP
         vbi7xPom/hAKS+vh1TDjToIHE1yFmvceEr+sOU9gvdSwAuUza70HWVyckyNk9QopBYX1
         MkXsQ4/1E876EGfyZ6kh34a9mx3suc4/UCoy3IZZW+9aFNYSXTFTmplc5WJolALY8d0z
         72UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OjD56YaXkaT+bUnze/IWClXeWQyNzmBoBBWle888BVo=;
        b=avWMtBnespAySZivOPDu/6wLG+mzqpIS5cG4+WBrI1m/JfSKAtYNK0MdXwymYyzMMQ
         z6RwlbVNr9RROq9uLVLfkCTuRP3vxf3gigJFfYw2R8PdWx7kZ7H/BdAhVo0ie3jHDD6l
         qB2wsZiE3WorVZtxvm48hyxYz+ZONkOcUvl8+bRwBHX0gXezVVoj14cO97d/QslrPIkd
         0jeIZ33bT9yvsLgOBn/bIjO88R5uVjfZBzvmY3k71jNLOCXb+N951Mn7o2xoz11Ng5uk
         wNYkaeF4HGfPsO4zlcRWSMXxTY5JIZyMZ/lAd/II8TLxsLvYgTXF8a+SHuXkndMSLnvD
         mtDQ==
X-Gm-Message-State: APjAAAUpT5WYQCAcBbqNnTrSBLqcBExNwLfgzcDbzYn6364zilzjCQZ5
        WwtKELAAO6tymghjkfnFb9X4xw==
X-Google-Smtp-Source: APXvYqyz9/0SYln6Caiw07l6O3NkVIuHjnsFKotpx63fIUBWVCxgzkeG8zEYm693aWnwooeNeg8Mrw==
X-Received: by 2002:a19:844:: with SMTP id 65mr12945183lfi.20.1580759482454;
        Mon, 03 Feb 2020 11:51:22 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:466f:add8:5793:bc04:7360:f621])
        by smtp.gmail.com with ESMTPSA id o69sm9363803lff.14.2020.02.03.11.51.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2020 11:51:21 -0800 (PST)
Subject: [PATCH RFT 5/5] sh_eth: use Gigabit register map for R7S72100
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org
Cc:     Chris Brandt <chris.brandt@renesas.com>
References: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <a28c0b63-b221-07fa-c89c-d82ae70d0c7a@cogentembedded.com>
Date:   Mon, 3 Feb 2020 22:51:20 +0300
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

The register maps for the Gigabit controllers and the Ether one used on
RZ/A1  (AKA R7S72100) are identical except for GECMR which is only present
on the true GEther controllers.  We no longer use the register map arrays
to determine if a given register exists,  and have added the GECMR flag to
the 'struct sh_eth_cpu_data' in the previous patch, so we're ready to drop
the R7S72100 specific register map -- this saves 216 bytes of object code
(AArch gcc 4.8.5). 

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   68 ----------------------------------
 drivers/net/ethernet/renesas/sh_eth.h |    1 
 2 files changed, 1 insertion(+), 68 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -142,69 +142,6 @@ static const u16 sh_eth_offset_gigabit[S
 	[FWALCR1]	= 0x00b4,
 };
 
-static const u16 sh_eth_offset_fast_rz[SH_ETH_MAX_REGISTER_OFFSET] = {
-	SH_ETH_OFFSET_DEFAULTS,
-
-	[EDSR]		= 0x0000,
-	[EDMR]		= 0x0400,
-	[EDTRR]		= 0x0408,
-	[EDRRR]		= 0x0410,
-	[EESR]		= 0x0428,
-	[EESIPR]	= 0x0430,
-	[TDLAR]		= 0x0010,
-	[TDFAR]		= 0x0014,
-	[TDFXR]		= 0x0018,
-	[TDFFR]		= 0x001c,
-	[RDLAR]		= 0x0030,
-	[RDFAR]		= 0x0034,
-	[RDFXR]		= 0x0038,
-	[RDFFR]		= 0x003c,
-	[TRSCER]	= 0x0438,
-	[RMFCR]		= 0x0440,
-	[TFTR]		= 0x0448,
-	[FDR]		= 0x0450,
-	[RMCR]		= 0x0458,
-	[RPADIR]	= 0x0460,
-	[FCFTR]		= 0x0468,
-	[CSMR]		= 0x04E4,
-
-	[ECMR]		= 0x0500,
-	[RFLR]		= 0x0508,
-	[ECSR]		= 0x0510,
-	[ECSIPR]	= 0x0518,
-	[PIR]		= 0x0520,
-	[APR]		= 0x0554,
-	[MPR]		= 0x0558,
-	[PFTCR]		= 0x055c,
-	[PFRCR]		= 0x0560,
-	[TPAUSER]	= 0x0564,
-	[MAHR]		= 0x05c0,
-	[MALR]		= 0x05c8,
-	[CEFCR]		= 0x0740,
-	[FRECR]		= 0x0748,
-	[TSFRCR]	= 0x0750,
-	[TLFRCR]	= 0x0758,
-	[RFCR]		= 0x0760,
-	[MAFCR]		= 0x0778,
-
-	[ARSTR]		= 0x0000,
-	[TSU_CTRST]	= 0x0004,
-	[TSU_FWSLC]	= 0x0038,
-	[TSU_VTAG0]	= 0x0058,
-	[TSU_ADSBSY]	= 0x0060,
-	[TSU_TEN]	= 0x0064,
-	[TSU_POST1]	= 0x0070,
-	[TSU_POST2]	= 0x0074,
-	[TSU_POST3]	= 0x0078,
-	[TSU_POST4]	= 0x007c,
-	[TSU_ADRH0]	= 0x0100,
-
-	[TXNLCR0]	= 0x0080,
-	[TXALCR0]	= 0x0084,
-	[RXNLCR0]	= 0x0088,
-	[RXALCR0]	= 0x008C,
-};
-
 static const u16 sh_eth_offset_fast_rcar[SH_ETH_MAX_REGISTER_OFFSET] = {
 	SH_ETH_OFFSET_DEFAULTS,
 
@@ -593,7 +530,7 @@ static struct sh_eth_cpu_data r7s72100_d
 	.chip_reset	= sh_eth_chip_reset,
 	.set_duplex	= sh_eth_set_duplex,
 
-	.register_type	= SH_ETH_REG_FAST_RZ,
+	.register_type	= SH_ETH_REG_GIGABIT,
 
 	.edtrr_trns	= EDTRR_TRNS_GETHER,
 	.ecsr_value	= ECSR_ICD,
@@ -3139,9 +3076,6 @@ static const u16 *sh_eth_get_register_of
 	case SH_ETH_REG_GIGABIT:
 		reg_offset = sh_eth_offset_gigabit;
 		break;
-	case SH_ETH_REG_FAST_RZ:
-		reg_offset = sh_eth_offset_fast_rz;
-		break;
 	case SH_ETH_REG_FAST_RCAR:
 		reg_offset = sh_eth_offset_fast_rcar;
 		break;
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -145,7 +145,6 @@ enum {
 
 enum {
 	SH_ETH_REG_GIGABIT,
-	SH_ETH_REG_FAST_RZ,
 	SH_ETH_REG_FAST_RCAR,
 	SH_ETH_REG_FAST_SH4,
 	SH_ETH_REG_FAST_SH3_SH2
