Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF6418D3EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 17:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgCTQOT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 12:14:19 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:38567 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbgCTQOS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 12:14:18 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MlO5j-1jgvDA0z2z-00lkbd for <linux-renesas-soc@vger.kernel.org>; Fri, 20
 Mar 2020 17:14:17 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id F3E9D65034C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 16:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id siatKkIGiK9E for <linux-renesas-soc@vger.kernel.org>;
        Fri, 20 Mar 2020 17:14:16 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 8017664C102
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 17:14:16 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:14:16 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 37E03804FB; Fri, 20 Mar 2020 17:11:40 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:11:40 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v3 00/11] media: adv748x: add support for HDMI audio
Message-ID: <cover.1584720678.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7662
X-Provags-ID: V03:K1:C0O40E+KEs8zksNE9ubCpW7W4I+nbKTAAMUUOo8qcFzQEoymuuq
 wg6PAOfo09sOx7C0K8RWnhAmdN8wiLZHehl7+4TqQXNm+MvKQoPU/sfQ/VWLnym9urdMFZD
 pYJsUBAJKsjLqbLAlcTVueJp2C8kNGVAK0qqzHNqKxuEIRuaacPLEunHpISyHkVVzMq/maT
 v3uuDYMoZ/xKaVUbJvNKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ncImAM+Vg50=:OBohXHc3iNTa56N1k9nd2l
 byL9EZepkmsrXbv3Z6c7H+muwCy2excAVhDf1EXVFRG2Ds1jpovluS8p2bHjNLcpLm6hgvejF
 ehjyeNdD3+oblWJySrLUrAeF7SNs2diIDSwNzBDYD3kqts7jGsSTp571Dx4NyQ8smFaGGy77x
 GHuctrjnyxUmnsqT5QslU+o2TobbI5e4w9oGIoMPY2psoC25MDTXuGRu03zd0YtHXnphIQlyu
 tmXLBQoEv6lOwcsnbEKaL2wfHzLCqMYPcjz9CvuwDtPN7omZfi5fHKUwTFSDc5RA+kd7f2oyA
 2BIylgSPREfcptiqNUWS/RbdgREiyQIEcPu57uBoaPvTNCCIUC5g7Sm5/VhONXqx/MUkE1Bnu
 ksfDjY8qE5TSgaYl9hoavLPrtVa0dSNBwXEuzI6WLhZIE3VddDis4TbRy0hafMPN5RCA+85yk
 6taVnKC/FaGOFkVxwJ+Eoxkj1V7y+QJtWsmcrlEDI3blkuCkmAuyBavTAJZfqwVX98sOQEsEw
 RTPDnOig6M7j0JZHfTOaHkxhh0lHJu16TbYNIYw/bFLJLD8ZOKTC6atYiJoCRbK9kbAi5J+oz
 vjfQ4VCYz3DauDIY1tnGakKkBlLJylx6mfh5mroL9AMYuT2WhRVzaEE5cMJtv9gxMYqf/Ne7W
 KqttLgHbcFXBJD5xrEHIvLROqIZyK23wyB3UjtGAKrZhOyYbozB0cNx6++wBJ/BtIndpIma7A
 hvIojvNfAdA24oJFdjcGuU1ULh/nq/jxEXxSDvqEfyXAykqax1PqtQd1EyLBweO9ha2Lc2EN+
 VUeQHy0fdllo3d7wCPI2WuqeYaoaWtwPiyBvGvpT47njfPWwjGnoLUMGMi/IpKR/XMwJh4/
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This adds minimal support for accessing the HDMI audio provided through the
I2S port available on ADV7481 and ADV7482 decoder devices by ADI.
The port carries audio signal from the decoded HDMI stream.

Currently, the driver only supports I2S in TDM, 8 channels a 24bit at 48kHz.
Furthermore, only left-justified, 8 slots, 32bit/slot TDM, at 256fs has been
ever tried.

An ADV7482 on the Renesas Salvator-X ES1.1 (R8A77950 SoC) was used during
development of this code.

Changes since v2:
  - prepare/enable the clock when it is used, as it seems nothing else does
    this otherwise

  - give the clock a unique name to ensure it can be registered if there are
    multiple adv748x devices in the system

  - remove optionality note from clock cell description to ensure the device
    description matches the real device (the line is always present, even
    if not used)

Changes since v1:
  - Add ssi4_ctrl pin group to the sound pins. The pins are responsible for
    SCK4 (sample clock) WS4 and (word boundary input), and are required for
    SSI audio input over I2S.
    Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

  - Removed the audio clock C from the list of clocks of adv748x,
    it is exactly the other way around.
    Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

  - Add an instance of (currently) fixed rate I2S master clock (MCLK),
    connected to the audio_clk_c line of the R-Car SoC.
    Explicitly declare the device a clock producer and add it to the
    list of clocks used by the audio system of the Salvator-X board.
    Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>

  - The implementation of DAI driver has been moved in a separate file
    and modified to activate audio decoding and I2S streaming using
    snd_soc_dai_... interfaces. This allows the driver to be used with
    just ALSA interfaces.

  - The ioctls for selecting audio output and muting have been removed,
    as not applicable.
    Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
    I have left implementation of the QUERYCAP in, as it seems to be required
    by v4l-ctl to support loading of EDID for this node. And setting the EDID
    is one feature I desperately need: there are devices which plainly refuse
    to talk to the sink if it does not provide EDID they like.

  - A device tree configuration without audio port will disable the audio code
    altogether, supporting integrations where the port is not connected.

  - The patches have been re-arranged, starting with the generic changes and
    changes not related to audio directly. Those will be probably sent as a
    separate series later.

  - The whole series has been rebased on top of v5.6-rc6

Alex Riesen (11):
  media: adv748x: fix end-of-line terminators in diagnostic statements
  media: adv748x: include everything adv748x.h needs into the file
  media: adv748x: reduce amount of code for bitwise modifications of
    device registers
  media: adv748x: add definitions for audio output related registers
  media: adv748x: add support for HDMI audio
  media: adv748x: prepare/enable mclk when the audio is used
  media: adv748x: only activate DAI if it is described in device tree
  dt-bindings: adv748x: add information about serial audio interface
    (I2S/TDM)
  arm64: dts: renesas: salvator: add a connection from adv748x codec
    (HDMI input) to the R-Car SoC
  media: adv748x: add support for log_status ioctl
  media: adv748x: allow the HDMI sub-device to accept EDID

 .../devicetree/bindings/media/i2c/adv748x.txt |  16 +-
 .../boot/dts/renesas/r8a77950-salvator-x.dts  |   3 +-
 .../boot/dts/renesas/salvator-common.dtsi     |  47 ++-
 drivers/media/i2c/adv748x/Makefile            |   3 +-
 drivers/media/i2c/adv748x/adv748x-afe.c       |   6 +-
 drivers/media/i2c/adv748x/adv748x-core.c      |  60 ++--
 drivers/media/i2c/adv748x/adv748x-csi2.c      |   8 +-
 drivers/media/i2c/adv748x/adv748x-dai.c       | 282 ++++++++++++++++++
 drivers/media/i2c/adv748x/adv748x-hdmi.c      | 212 ++++++++++++-
 drivers/media/i2c/adv748x/adv748x.h           |  67 ++++-
 10 files changed, 662 insertions(+), 42 deletions(-)
 create mode 100644 drivers/media/i2c/adv748x/adv748x-dai.c

-- 
2.25.1.25.g9ecbe7eb18

