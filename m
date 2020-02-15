Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCCB916005B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Feb 2020 21:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgBOUGc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 15 Feb 2020 15:06:32 -0500
Received: from mail-lj1-f180.google.com ([209.85.208.180]:39519 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgBOUGc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Feb 2020 15:06:32 -0500
Received: by mail-lj1-f180.google.com with SMTP id o15so14434320ljg.6
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Feb 2020 12:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=CgbX84O3ft6fmC+1iI0+9cb+o/dTUtmTdICmwBnWugc=;
        b=cd3sxkpKPDX4WZP2ju0MwzrRgjixH74aQqywxPW0w55qH7x4Skff/yjGcZEzpPF89M
         YmOnv9kyX6xjGctSkK9c0QXBJpQn2Ye8MGuROj5+9/tJwkS8I9EvpomBnO4gd7co6BmA
         oSjoeIrflRTtPwJ+WgcxhJwFudII4OsDq5gQ/dKcjXwnimD0/YP5oKpYqUYGXpEka0/w
         Tc8lzw4GlSB4RIZ9K5ZsWkJxR242o6bga65q9TlWObhKu+V0Qtq2UhsnhOb3GPAaRKrQ
         gZ+GOt32wgj+0+XSkzYP5ewQBNnbaTlSWi1f0EeERMEdPoLV63cCjuqsQJ3ruoYOOPEd
         QYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=CgbX84O3ft6fmC+1iI0+9cb+o/dTUtmTdICmwBnWugc=;
        b=odt06vEfDC8rtfgEr3d8AMZBr3yAVLyAqSZ55ShcXbH8CvX5aX6P0oAvGBHqZiMCm+
         2LfP6K0WZRwztA0OgRb3h+KEhPD9Mxyhj8jYvtThj8Ml3qsr7EYEh6CGysQSGqDptyyy
         PfTmu4TMXP2Tq45zSqzE5ta33VN5tlqB/vlqtcxw3VhMD7nBao4MbumuRleODSaM79hO
         5RC6dEV1I1WrxQwmOLZb7qusWa+uH5D1a8UlMOM2xf/PIwCRF8EpN6sUC08FPiZvucyx
         VviEoBRF1IOInQSxLtgqPFQrJGkyty4mKwTy2t82KpSy15dYN1TvQ9ACZMsXyHfq7PhJ
         QZcw==
X-Gm-Message-State: APjAAAX5wyqW1Lisz0dVDhhdQYZGFgmxmczK+FoWmLlCs9MxnO4tyc0H
        r3gXQ8Aqx+/bOdFi3GP1GSca0v5h5io=
X-Google-Smtp-Source: APXvYqw0FB/V6AsqhJ4tEMw6zXvVvsPSW3oMaPbw+Xc9d9UJ6VqadMeqYKlo9BohRiV74e0+zFNAtg==
X-Received: by 2002:a2e:880c:: with SMTP id x12mr5698493ljh.44.1581797189489;
        Sat, 15 Feb 2020 12:06:29 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:49d:f851:9745:99c9:a1aa:2f9c])
        by smtp.gmail.com with ESMTPSA id i197sm4820056lfi.56.2020.02.15.12.06.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 12:06:28 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH net-next v2 0/5] sh_eth: get rid of the dedicated regiseter
 mapping for RZ/A1 (R7S72100)
To:     "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org
Organization: Cogent Embedded
Message-ID: <effa9dea-638b-aa29-2ec3-942974de12a0@cogentembedded.com>
Date:   Sat, 15 Feb 2020 23:06:27 +0300
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

I changed my mind about the RZ/A1 SoC needing its own register
map -- now that we don't depend on the register map array in order
to determine whether a given register exists any more, we can add
a new flag to determine if the GECMR exists (this register is
present only on true GEther chips, not RZ/A1). We also need to
add the sh_eth_cpu_data::* flag checks where they were missing
so far: in the ethtool API for the register dump.

[1/5] sh_eth: check sh_eth_cpu_data::no_tx_cntrs when dumping registers
[2/5] sh_eth: check sh_eth_cpu_data::cexcr when dumping registers
[3/5] sh_eth: check sh_eth_cpu_data::no_xdfar when dumping registers
[4/5] sh_eth: add sh_eth_cpu_data::gecmr flag
[5/5] sh_eth: use Gigabit register map for R7S72100

MBR, Sergei
