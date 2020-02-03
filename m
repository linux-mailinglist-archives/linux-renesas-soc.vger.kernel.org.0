Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43FDE151065
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2020 20:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgBCTkk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Feb 2020 14:40:40 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39449 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgBCTkk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Feb 2020 14:40:40 -0500
Received: by mail-lf1-f66.google.com with SMTP id t23so10544104lfk.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Feb 2020 11:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y+XGtNs7Xb7XdnDloziiltJEPHsx0vzP5n43VgzYTFA=;
        b=LaXJ+WXcilpUT2wy7/fIQuYEm/VoXf5OnrsZOaFbaJrqBeiwbgzq7uYcZl1HyLek1x
         6SYCKUMpK7+uqtSY16FER7BN68MnWikH0Hczye6jmd7P605P9H0CYWOgYZtaXrtUDJsF
         VGzmMerVz2QkpEk7eSolWn+XnGG2JNSlT1iiTTPLsCM/zI0YYNR6cTTKez5vDgjBfIjV
         +bWFIS+Ooo++OVK7GioYvXopHM3u4P67xjHNiR/ygBhFnHV0blowTBodKte6uD0HfdXL
         7Q8Hm5FSgjNyCU5EuCFqur1mfRWMJVGe4PMkEpP8zmEIsOmdYP1iRRc+doKjUvSiwn+x
         trXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=y+XGtNs7Xb7XdnDloziiltJEPHsx0vzP5n43VgzYTFA=;
        b=q9qFy1Ow6fzcL5ki1QIqGOb0laNF+hjFqIdMKB5KjOFzwLDCAXkc9OVI6amf4iHBam
         CePijTT7FQSrklrrGjGS7utnJa//EwE2Jhoa+Zeh4JP50Gr3GvO1oDLPx9dOmUav190G
         8UuOgkQUYys2PA4nTmQEvRPLzIpR17rLRs8G5+LL6UrIxTz1fhM3dx4XdM7Tfq1lFzSo
         KSAdk1dOUpQUxPb7ZRTQFf2fGyHz0gwWTti9b8w1vjFomUbJUgWbeQba2giI6Z7uH+uR
         lKH1vmNpC25oOx1NCss+cKfYstMbAyd5DT5EhcuRBl0zyJwoq8SpVNAD4YfeKcHMbqsN
         6ZCA==
X-Gm-Message-State: APjAAAXNxzHd1RavPkkWN+1yn3NukhH6Rja7ryTymdluGKuhvLdPcCQT
        ltiwcKIRTQihMd7bPlpSFRL/xw==
X-Google-Smtp-Source: APXvYqx34gr8iy5F8p+EvPhaPu0eCmpvD3zTBqJNOT3Mx/QWrYzMyW6+sRX7CvkYXR9sRatJ2aw/Bg==
X-Received: by 2002:a19:c7d8:: with SMTP id x207mr12979161lff.142.1580758838156;
        Mon, 03 Feb 2020 11:40:38 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:466f:add8:5793:bc04:7360:f621])
        by smtp.gmail.com with ESMTPSA id g27sm9433760lfh.57.2020.02.03.11.40.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2020 11:40:37 -0800 (PST)
Subject: [PATCH RFT 1/5] sh_eth: check sh_eth_cpu_data::no_tx_cntrs when
 dumping registers
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org
Cc:     Chris Brandt <chris.brandt@renesas.com>
References: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <fe2b8a48-52f8-e0a2-82fd-37ca93b8005e@cogentembedded.com>
Date:   Mon, 3 Feb 2020 22:40:36 +0300
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

When adding the sh_eth_cpu_data::no_tx_cntrs flag I forgot to add the
flag check to  __sh_eth_get_regs(), causing the non-existing TX counter
registers to be considered for dumping on the R7S72100 SoC (the register
offset sanity check has the final say here)...

Fixes: ce9134dff6d9 ("sh_eth: add sh_eth_cpu_data::no_tx_cntrs flag")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -2184,10 +2184,12 @@ static size_t __sh_eth_get_regs(struct n
 		add_reg(BCULR);
 	add_reg(MAHR);
 	add_reg(MALR);
-	add_reg(TROCR);
-	add_reg(CDCR);
-	add_reg(LCCR);
-	add_reg(CNDCR);
+	if (!cd->no_tx_cntrs) {
+		add_reg(TROCR);
+		add_reg(CDCR);
+		add_reg(LCCR);
+		add_reg(CNDCR);
+	}
 	add_reg(CEFCR);
 	add_reg(FRECR);
 	add_reg(TSFRCR);
