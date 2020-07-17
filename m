Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A36223737
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 10:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbgGQIgZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 04:36:25 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56656 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727853AbgGQIgZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 04:36:25 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2F4FE1C0BDF; Fri, 17 Jul 2020 10:36:21 +0200 (CEST)
Date:   Fri, 17 Jul 2020 10:36:20 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2 03/11] arm64: dts: renesas: hihope-common: Separate
 out Rev.2.0 specific into hihope-common-rev2.dtsi file
Message-ID: <20200717083620.GD1027@bug>
References: <1593004330-5039-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1593004330-5039-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593004330-5039-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

Can we have node names consistent with other systems?

> +	leds {
> +		compatible = "gpio-leds";
> +
> +		bt_active_led {
> +			label = "blue:bt";
> +			gpios = <&gpio7  0 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "hci0-power";
> +			default-state = "off";
> +		};
> +
> +		wlan_active_led {
> +			label = "yellow:wlan";
> +			gpios = <&gpio7  1 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "phy0tx";
> +			default-state = "off";
> +		};
> +	};

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
