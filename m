Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54AE4646B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 06:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbhLAFcZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 00:32:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhLAFcY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 00:32:24 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71C1CA15;
        Wed,  1 Dec 2021 06:29:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638336543;
        bh=18rskSMhCWOeDsN6haLX9hFk3hSUOW3sLWSQxJqBq2g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YX515xM6wIxFMa55P6ePQTTCdGELPEkfBn83BIb3/wx379UtoS3Ln4WGZE98OF51x
         PrxYYVAJFxY5s6hDsTIGoUvNZ7Mg38EtcsfHQwPSRmH5lJEB3202L2/18gVno/0I1d
         H0+hmcYMVn7ltUSDI5BSzreAXhy5rBbZSQpHGmhs=
Date:   Wed, 1 Dec 2021 07:28:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/2] arm64: dts: renesas: r8a779a0 DU support
Message-ID: <YacIBqPcq12TEDeM@pendragon.ideasonboard.com>
References: <20211130164311.2909616-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211130164311.2909616-1-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Tue, Nov 30, 2021 at 04:43:09PM +0000, Kieran Bingham wrote:
> Provide the DT nodes for the DSI found on the r8a779a0, and extend the
> falcon-cpu board add on with the TI SN65DSI86 bridge which is used to
> connect the DSI output to the mini display-port connector on the Falcon
> CPU board.
> 
> This has been successfully tested on a Falcon-V3U with patches to the
> rcar_du and sn65dsi86 which will be sent separately.
> 
> Since the previous version, the core "r8a779a0: Add DU support" has
> already been accepted into the renesas-drivers tree, and the "r8a779a0:
> Provide default DSI data-lanes" patch has been dropped in favour of a
> better construction in the two patches supplied here.

I've reposted the DSI driver and its bindings, and unless something goes
terribly wrong, I'll send a pull request in a couple of days.

Geert, how would you like to proceed with the DT changes ?

> Kieran Bingham (2):
>   arm64: dts: renesas: r8a779a0: Add DSI encoders
>   arm64: dts: renesas: r8a779a0: falcon-cpu: Add DSI display output
> 
>  .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 79 +++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 60 ++++++++++++++
>  2 files changed, 139 insertions(+)
> 

-- 
Regards,

Laurent Pinchart
