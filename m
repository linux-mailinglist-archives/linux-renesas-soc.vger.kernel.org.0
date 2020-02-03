Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF4115106B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2020 20:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbgBCTmV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Feb 2020 14:42:21 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38696 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbgBCTmV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Feb 2020 14:42:21 -0500
Received: by mail-lj1-f196.google.com with SMTP id w1so15974188ljh.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Feb 2020 11:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zvth4P49amLm0mD060xQCByzqZe7STXCNoAcJIYi1Wk=;
        b=PULidSok/wfR5IN75sT8NUg8qgcXqW/8Sc9WMNZLFPvXeYSHPl/EvTOBwitDrkYIDi
         wWpTHuL9ZSSCi8fftQgGXbQdjdj2HWdvwO6GIrOEqzzVjUq5rAe8nToMZ+9tGxe7cESY
         w6hHSPb+4Ketap4HO6qE1ffHxUO25r7ulRbzZiV5LRz3X00suFfFnKMyTu20q4wOLv7+
         fdl70WDTOR/tA/3KiRJ79CmMW7fYtJUWoOaW8fLcqxfTQ6X9kpdP9jWQbe2nNuBeJlxP
         abTQlVSEPJsoaggkB28qELylJ55hoqJWE1Mj5oVL3v07ICUnvtAVCHsq9YFZ2idoVmKK
         NBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Zvth4P49amLm0mD060xQCByzqZe7STXCNoAcJIYi1Wk=;
        b=EuIviA6hCsInJbYOwRyAy459rb7oZR9JQl0teaUOHA2+edq4KnqKNe5hKfHZ26dsC1
         JitUJhYLu/jNxUGO9A5AUONCkiB9dsv3icSwhf4Cd3aBGur6nRr92ExTZUcIB8p8eufb
         e3K1QFTtlcfZnyNa4uhOVFMlDTN/xXIfcwjingLVMMFZUfTq616SPwq97M/jTX98fkBO
         jFsEYASDOTpuspUU26KmCh/6QODicD2AQwzPYyoDZOTbPwR7jiAMdujFGZs3LOK9xPLK
         ZcUT9bBzpH7Ykm+Ldzvzh9V5ehqtygv+VQnbgtnydfwGJRE/DLR8GQTUbk80ZVb5y33a
         YNzw==
X-Gm-Message-State: APjAAAVvmPUJDpjfA2zOGhhwrmXayTBbmfCl3PmGtD+UH9n0aS1M9wSS
        b2UEHBvFk+uwgqB4wfquatWZww==
X-Google-Smtp-Source: APXvYqzvHLIFOup3S0S1LvRSndK4lyP+bCIAF0p3aiDkzdl3/n0rSn1rCDixrKMF1tKq/arkYOWjcw==
X-Received: by 2002:a2e:868c:: with SMTP id l12mr14726857lji.194.1580758937624;
        Mon, 03 Feb 2020 11:42:17 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:466f:add8:5793:bc04:7360:f621])
        by smtp.gmail.com with ESMTPSA id g25sm10087652ljn.107.2020.02.03.11.42.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2020 11:42:16 -0800 (PST)
Subject: [PATCH RFT 2/5] sh_eth: check sh_eth_cpu_data::cexcr when dumping
 registers
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org
Cc:     Chris Brandt <chris.brandt@renesas.com>
References: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <baff2380-7830-d0ee-8b49-12484fa055a9@cogentembedded.com>
Date:   Mon, 3 Feb 2020 22:42:15 +0300
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

When adding the sh_eth_cpu_data::cexcr flag I forgot to add the flag
check to  __sh_eth_get_regs(), causing the non-existing RX packet counter
registers to be considered for dumping on  the R7S72100 SoC (the register
offset sanity check has the final say here)...

Fixes: 4c1d45850d5 ("sh_eth: add sh_eth_cpu_data::cexcr flag")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -2194,8 +2194,10 @@ static size_t __sh_eth_get_regs(struct n
 	add_reg(FRECR);
 	add_reg(TSFRCR);
 	add_reg(TLFRCR);
-	add_reg(CERCR);
-	add_reg(CEECR);
+	if (cd->cexcr) {
+		add_reg(CERCR);
+		add_reg(CEECR);
+	}
 	add_reg(MAFCR);
 	if (cd->rtrate)
 		add_reg(RTRATE);
