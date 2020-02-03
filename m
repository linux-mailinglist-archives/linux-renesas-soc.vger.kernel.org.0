Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9DA151052
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2020 20:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgBCTeT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Feb 2020 14:34:19 -0500
Received: from mail-lf1-f44.google.com ([209.85.167.44]:44955 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgBCTeT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Feb 2020 14:34:19 -0500
Received: by mail-lf1-f44.google.com with SMTP id v201so10507579lfa.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Feb 2020 11:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=0F0jgU9jQTt/WheaDikjmCB+k0rHRky3Ds9iD4lYiYQ=;
        b=Irqfz370S22riicMWRfgTQ/qBX9Dn1cQ5BxVCYGs1xdkxkJgM7ln5B+0xxs3Gjt3pe
         sMRFfMQklPQg8QKOVU06IOGQMEUSs5hio9R4VL3CECKsfO/x3bzI0jFzS/9NQQp9Vj3u
         DDGZfyhUBjXtMCcPG+/rIKKpeQUYNej50la2Mfp3gnbpjZIymQKxkO6P6T2rjNRLTapd
         mVy+4LJg5iIsxxEPDGzBT4jG3YR3Pek8+5g+nKPhsZhlSKtWP3ot1MOpm5POgr1+yzrS
         S26bOlRhKKdshRAljGo21/hXSx9p6zNMuHzLluTeFuI+NNYMIXWNyj0EXd3d2xAjy7iO
         g1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=0F0jgU9jQTt/WheaDikjmCB+k0rHRky3Ds9iD4lYiYQ=;
        b=ijLyUdZ/1mWeQuJh3Yy6VTirwYc1tgEXZyE4JerMCrMAD8aAVbcW3pZxEdDBTcOoMF
         4/d1u+YfmbVXHTvtPFZfM//FkwAUBWID4rMHE1cbajELRtpKCnn1WZ8UXqeQoHhG8TaA
         yY87x/QSGqhp5nS+He4F47PZGAkhJkjqKRReVtCbDynx7vu16znms8/pjFVpe6UVD33K
         YNRFoOZm3h4+OEBVVWKd/GSqnHFqzU04CISFmCClRDw3oormqD/kf520gtST7w584BTe
         WCRX1UFmNiSVxD3wEacJaeswQ/cmndTejzVA/hjkyt5hg0gvNLUiVOoXQaJAwsJlecQe
         yLlA==
X-Gm-Message-State: APjAAAXQ5GdZfennlL4nIGmyQBJhSEZw5FErXslshO4pIwYB+iVOkKCR
        PePRgdUaquN5cTdoTngDo2tg6A==
X-Google-Smtp-Source: APXvYqw6u3j1f/ZFSh3tY3zMHiBeul6A/wkwRji9rlQh+fTvFPiNeI2x/btyYYEMzDHSMui2fHsnfQ==
X-Received: by 2002:ac2:5612:: with SMTP id v18mr11910448lfd.172.1580758455970;
        Mon, 03 Feb 2020 11:34:15 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:466f:add8:5793:bc04:7360:f621])
        by smtp.gmail.com with ESMTPSA id 138sm9470242lfa.76.2020.02.03.11.34.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2020 11:34:15 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH RFT 0/5] sh_eth: get rid of the dedicated regiseter mapping
 for RZ/A1 (R7S72100)
To:     "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org
Cc:     Chris Brandt <chris.brandt@renesas.com>
Organization: Cogent Embedded
Message-ID: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
Date:   Mon, 3 Feb 2020 22:34:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

Here's a set of 5 patches against DaveM's 'net-next.git' repo.

I changed my mind about the RZ/A1 SoC needing its own register map --
now that we don't depend on the register map array in order to
determine whether a given register exists any more, we can add
a new flag to determine if the GECMR exists (this register is
present only on true GEther chips, not RZ/A1). We also need to
add the sh_eth_cpu_data::* flag checks where they were missing
so far: in the ethtool API for the register dump. I'd appreciate
if Chris Brandt could sanity-test this patch set as he seem to
still have the RZ/A1 hardware...
I'm not posting the patch set to the 'netdev' ML as the 'net-next' patches are unacceptable during the merge window there...

[1/5] sh_eth: check sh_eth_cpu_data::no_tx_cntrs when dumping registers
[2/5] sh_eth: check sh_eth_cpu_data::cexcr when dumping registers
[3/5] sh_eth: check sh_eth_cpu_data::no_xdfar when dumping registers
[4/5] sh_eth: add sh_eth_cpu_data::gecmr flag
[5/5] sh_eth: use Gigabit register map for R7S72100

MBR, Sergei
