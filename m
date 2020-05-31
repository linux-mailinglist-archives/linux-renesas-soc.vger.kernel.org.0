Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A901E9971
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 May 2020 19:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgEaRbA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 May 2020 13:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgEaRbA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 May 2020 13:31:00 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E865C05BD43
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 May 2020 10:31:00 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id m18so5277464ljo.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 May 2020 10:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U+ftINrOA+kmRvsJhkTq7rpVSC1yiTvQH2y0M6Ic020=;
        b=XW8nHadCLasGtn40h3x+RxOuS/L2eMigg025to20Lrh4YVe0x/QjdYgzxbFodsb8M+
         LtYYs9404sul2rB9C1pu9+26Cl6fabsQN7NI/eXdemYjED+zBbOe0XKyOqWAJsUrBxHr
         o+fFxK8GD5/evtb6aHhIurC3nne8xVE3uw/WA0SP/0L6czDoNvheQxIRzBzInB+rb1GV
         XaW57QtQX6GuOCDkyPlS5J1XqESTn86dG2Gc6QsNcqkHQ4rtgf8uuDXYgDFHtZi82z3o
         Eoy4qSkce2YiETr5qaUtZFUnE9rHeON8IQ/6Qf/leYR/2dTXlQz27K2uOuFPsMEe2xF+
         W6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U+ftINrOA+kmRvsJhkTq7rpVSC1yiTvQH2y0M6Ic020=;
        b=RaN/alAuxeKLVTBcg54Bbz4bTGHUbpgLN8V2+xg6KQA0iQ+/ljb/AP1sSQdNfe4No9
         I87NO3SyhDfvk5uy8itNpX2ZyvYSJb2PcuSAmcphMg1cu25QPcQWBTHDmvFRvCSxZbfW
         CEll62Np7OPMt6j0bHNHhDPQ6504OwcPBheI7k1oVbL/67GY4iVV9IuRK3Z5nYM0aCOX
         2um+QpVo+Vv9Kpt8yQ8s5GTem4BMpYNYDh45kp9RVrFe5v1XQR5KMn4nUF7tiaok9pK9
         GQHFlrnlmXAlV2I00VHT7blaVd+E04iNql82C8soFfSK9oLIMeco6k5VmVtEpUF9LiuV
         5dQA==
X-Gm-Message-State: AOAM5330DP0ZD5qPiyixIo7HvWiN9pOZ1cV/Lph9ePzihOnV7IHUx5sk
        eK7ZVyWib56RsD1xlYBGo4mp1g==
X-Google-Smtp-Source: ABdhPJz15zNFvak8GH+qaTWNpCKCnljnfH92jm9W8Tui8N9B95Hzb1w4z4wURHT8DM/WtWLzttH/hA==
X-Received: by 2002:a2e:8e64:: with SMTP id t4mr7401704ljk.414.1590946258520;
        Sun, 31 May 2020 10:30:58 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:623:2775:c819:56c9:e22:a1f6? ([2a00:1fa0:623:2775:c819:56c9:e22:a1f6])
        by smtp.gmail.com with ESMTPSA id t5sm3930633lff.39.2020.05.31.10.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2020 10:30:57 -0700 (PDT)
Subject: Re: [PATCH RFT] ravb: Mask PHY mode to avoid inserting delays twice
To:     David Miller <davem@davemloft.net>, geert+renesas@glider.be
Cc:     kuba@kernel.org, andrew@lunn.ch, linux@rempel-privat.de,
        philippe.schenker@toradex.com, f.fainelli@gmail.com,
        hkallweit1@gmail.com, linux@armlinux.org.uk,
        kazuya.mizuguchi.ks@renesas.com, grygorii.strashko@ti.com,
        wsa+renesas@sang-engineering.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200529122540.31368-1-geert+renesas@glider.be>
 <20200530.215102.921642191346859546.davem@davemloft.net>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ca3b597d-7593-0459-b7be-101f868317cf@cogentembedded.com>
Date:   Sun, 31 May 2020 20:30:55 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200530.215102.921642191346859546.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 31.05.2020 7:51, David Miller wrote:

>> Until recently, the Micrel KSZ9031 PHY driver ignored any PHY mode
>> ("RGMII-*ID") settings, but used the hardware defaults, augmented by
>> explicit configuration of individual skew values using the "*-skew-ps"
>> DT properties.  The lack of PHY mode support was compensated by the
>> EtherAVB MAC driver, which configures TX and/or RX internal delay
>> itself, based on the PHY mode.
>>
>> However, now the KSZ9031 driver has gained PHY mode support, delays may
>> be configured twice, causing regressions.  E.g. on the Renesas
>> Salvator-X board with R-Car M3-W ES1.0, TX performance dropped from ca.
>> 400 Mbps to 0.1-0.3 Mbps, as measured by nuttcp.
>>
>> As internal delay configuration supported by the KSZ9031 PHY is too
>> limited for some use cases, the ability to configure MAC internal delay
>> is deemed useful and necessary.  Hence a proper fix would involve
>> splitting internal delay configuration in two parts, one for the PHY,
>> and one for the MAC.  However, this would require adding new DT
>> properties, thus breaking DTB backwards-compatibility.
>>
>> Hence fix the regression in a backwards-compatibility way, by letting
>> the EtherAVB driver mask the PHY mode when it has inserted a delay, to
>> avoid the PHY driver adding a second delay.  This also fixes messages
>> like:
>>
>>      Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: *-skew-ps values should be used only with phy-mode = "rgmii"
>>
>> as the PHY no longer sees the original RGMII-*ID mode.
>>
>> Solving the issue by splitting configuration in two parts can be handled
>> in future patches, and would require retaining a backwards-compatibility
>> mode anyway.
>>
>> Fixes: bcf3440c6dd78bfe ("net: phy: micrel: add phy-mode support for the KSZ9031 PHY")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Applied to net-next, thank you.

    Why not to net.git? It's a fix after all...

MBR, Sergei
