Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56BDF78E39
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2019 16:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbfG2Okf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jul 2019 10:40:35 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:44934 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbfG2Okf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jul 2019 10:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=uvHE0hWUJLrSKxbCdwUl89MRrAkqzhfQK464Ih0/+WI=; b=KWhSyBj4gceT4pY8ReUh5Pd7fJ
        yzHN0avkF6m8NTc3lSzeDfBWHMbCh090W9zvb/JzXJQo7SRoogwjJ1Gx+Dwi1YxS5IpTNP0SFAqC2
        O4dDd7bTwxZfQrYz6ffOFwFnTzC3PCflqSqMNQm9Aiph0+RCvvBzxmADWi/vA7M0WLEs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hs6p9-0001pS-To; Mon, 29 Jul 2019 16:40:27 +0200
Date:   Mon, 29 Jul 2019 16:40:27 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: renesas: ebisu, draak: Limit EtherAVB to
 100Mbps
Message-ID: <20190729144027.GD4110@lunn.ch>
References: <20190729080356.13023-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729080356.13023-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 29, 2019 at 10:03:56AM +0200, Simon Horman wrote:
> * According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
>   August 24, 2018, the TX clock internal delay mode isn't supported
>   on R-Car E3 (r8a77990) and D3 (r8a77995).
> 
> * TX clock internal delay mode is required for reliable 1Gbps communication
>   using the KSZ9031RNX phy present on the Ebisu and Draak boards.
> 
> Thus, the E3 based Ebisu and D3 based Draak boards can not reliably
> use 1Gbps and the speed should be limited to 100Mbps.
> 
> Based on work by Kazuya Mizuguchi.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
