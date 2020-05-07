Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D12D1C92C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2020 16:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgEGO6N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 May 2020 10:58:13 -0400
Received: from pb-smtp20.pobox.com ([173.228.157.52]:63137 "EHLO
        pb-smtp20.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgEGO6N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 May 2020 10:58:13 -0400
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 81493CEABE;
        Thu,  7 May 2020 10:58:11 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=RvoqLAm6E1F9sc8szmi/z/waAck=; b=l6R4ig
        oyu55Dk2igYtcQHsvFbjMaF9RGXKq9et/a9WIv+BUueIGjitLer8bItqCdJqh7lL
        Pjaw8xItuPbCTu8pav5dimqp/OY8Wy5hvgS5ssYwu9ldzFEOdWrRhE7f6xzzuTKA
        G3twC2VRgX2P7K7nnM5girhHM5g2ssditrfV4=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 78D2ECEABD;
        Thu,  7 May 2020 10:58:11 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=avpgv82DmbB3yL/GA/TaTqceQa67MoZ6ohBnqrkR+4Q=; b=l0QLt9nNFzBYHAvu3zUntQuIDzb6t+XapKITA1VEv/wFKgMySZYT3gCggWCEz5wK11I4HgOhqw/6XPXclTA47eqzjUH005vsdKSClfRzx7PgpoqklvJ69vaNublc4kwZFnzUdE4PZmqxxWNPSeSzArIWhNv7AyHQTIJpFS7oQyE=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 6A4CFCEABC;
        Thu,  7 May 2020 10:58:08 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 65CA42DA0CE1;
        Thu,  7 May 2020 10:58:06 -0400 (EDT)
Date:   Thu, 7 May 2020 10:58:06 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
cc:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFC] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
In-Reply-To: <20200507080528.547-1-geert+renesas@glider.be>
Message-ID: <nycvar.YSQ.7.77.849.2005071056450.5637@knanqh.ubzr>
References: <20200507080528.547-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 29C2F538-9073-11EA-B970-B0405B776F7B-78420484!pb-smtp20.pobox.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 7 May 2020, Geert Uytterhoeven wrote:

> As upstream Linux does not support XIP,

What?


Nicolas
