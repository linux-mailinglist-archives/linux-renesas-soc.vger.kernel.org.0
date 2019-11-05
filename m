Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7A21F0731
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2019 21:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbfKEUq2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 15:46:28 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40337 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727821AbfKEUq2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 15:46:28 -0500
Received: by mail-lj1-f195.google.com with SMTP id q2so16914828ljg.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Nov 2019 12:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aYeTHAQ0OepBDrED6WaK/4DCT6cYyjmx78u4P2RJHfM=;
        b=QJMZTJzJCohXd2yT0ueXO2wV1wZCZ6r60VZ7gbF6iqZK8jeIZN4fZRDeORtIOUJt+B
         rLk+O1vLAhPksOUMfP+sswQ+i9Y3O8bHn8lKBKQ6bwdgjAX8lRBH2posrso4Cu4TkZmD
         iiVM8ugcD3Jo33kBQbwYINzK826CKycVtYR1S6+mvnSSRlwRG79T58ABNlMjaxKsogsG
         jHS1cGWt0SFgGxcSxUVE2VeDg7zFp2a2x7DEfsJd5sxipP0qC7r1scpVhhU5u2jQC5fN
         P+wth1gSxoRToRgLvU0DoXcTwRTXdHjbfmAwEiKMbOg7zMyMk1qXTCWkvP+TO8vO1Ctv
         qoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aYeTHAQ0OepBDrED6WaK/4DCT6cYyjmx78u4P2RJHfM=;
        b=evUeNF6O6SogvXEpAMjPWISRq/gx9YYl59CXIQo67p4MMPQtoFjDCH/C0eicvR0wi5
         F6q9x+aFhHAm2naZgVEwBnH2MAZmS8BUyHkmXBZKDtLVLO6IiuYkMt7GvUSg070NIDK3
         6QbEmi5wbcJovv/FdHcAzMTu9oFWlVq9s59zPvvyb5ud903PCNHtfU6REe/YC8psJC4g
         nDcrLGXBJZ18eIjBfKNdmb5oUVllAo+bph1RsGAtXhlNyxuDtnr9e9ckamXyN7KruCT2
         WC2Y96J4hSLGhv3t3uF4PWQUpclp96PpwmvwpNaDxEgYjoTw37qDP75s0qt/+IKEzxV5
         nusQ==
X-Gm-Message-State: APjAAAWN8Q9eN/zVVZ93G1GMoyZZWFvUghAonHADlC+7Ot0Dl4u+YH8s
        vbrvycPkjspU/J7HBKNSCkWW1A==
X-Google-Smtp-Source: APXvYqyw6NHD40DYjwQahlg2dvo4mhdS8WfCRdfTQ2QXHMkTYBceoTN5yR5O7gcqrTPrfJI7Rkk5sw==
X-Received: by 2002:a2e:320c:: with SMTP id y12mr24170826ljy.7.1572986784538;
        Tue, 05 Nov 2019 12:46:24 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:4676:82ae:81fa:6a29:87ee:449b])
        by smtp.gmail.com with ESMTPSA id f5sm8189979ljn.24.2019.11.05.12.46.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 12:46:23 -0800 (PST)
Subject: Re: [PATCH v2 2/2] phy: Renesas R-Car gen3 PCIe PHY driver
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
References: <04384ce6-b696-715d-2072-345654e3fccf@cogentembedded.com>
 <9e69a1ea-b52b-4295-c898-e1ac4df26f97@cogentembedded.com>
 <20191104132743.GA13342@vmlxhi-102.adit-jv.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <48467080-9c49-fd64-c39a-6e379f21b639@cogentembedded.com>
Date:   Tue, 5 Nov 2019 23:46:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20191104132743.GA13342@vmlxhi-102.adit-jv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 11/04/2019 04:27 PM, Eugeniu Rosca wrote:

[...]

>> This PHY is  still  mostly undocumented -- the only documented registers
>> exist on R-Car V3H (R8A77980) SoC where this PHY stays in a powered-down
>> state after a reset and thus  we  must power it up for PCIe to work...
> 
> Indeed, this [1] PCIE PHY driver looks entirely V3H-focused and looking
> at the "Table 54.5 PCIE Controller Phy Register Configuration" in Rcar3
> HW User’s Manual Rev.2.00 Jul 2019, _all_ except one PCIE PHY register
> (PHY_CLK_RST) exist on V3H and no other Rcar3 SoC.
> 
> So, except PHY_CLK_RST, this driver appears to be doomed to R8A77980.
> Ironically, PHY_CLK_RST is exactly the register we now need to manage
> to implement "Internal Reference Clock Supply" (HW man Chapter 54.3.14).

   Do you have in mind a working approach to switch internal/external clocks?
phy_set_mode()?

> Just to avoid any surprises on our side, do you see any issues in
> extending the driver to the whole R-Car3 family, even if only for the
> sake of controlling the non-V3H PHY_CLK_RST register?

   Depends on the previous question...

> [1] 2ce7f2f425ef74 ("phy: Renesas R-Car gen3 PCIe PHY driver")

MBR, Sergei
